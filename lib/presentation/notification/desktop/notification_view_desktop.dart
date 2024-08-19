import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumento/application/notifications/notifications_bloc.dart';
import 'package:monumento/domain/entities/notification_entity.dart';
import 'package:monumento/service_locator.dart';
import 'package:monumento/utils/app_colors.dart';
import 'package:monumento/utils/constants.dart';
import 'package:monumento/utils/enums.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationViewDesktop extends StatefulWidget {
  const NotificationViewDesktop({super.key});

  @override
  State<NotificationViewDesktop> createState() =>
      _NotificationViewDesktopState();
}

class _NotificationViewDesktopState extends State<NotificationViewDesktop> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      locator<NotificationsBloc>().add(LoadInitialNotifications());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.appBlack,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        bloc: locator<NotificationsBloc>(),
        builder: (context, state) {
          if (state is InitialNotificationsLoaded) {
            return NotificationListWidget(
              notifications: state.initialNotifications,
            );
          } else if (state is MoreNotificationsLoaded) {
            return NotificationListWidget(
              notifications: state.notifications,
            );
          } else if (state is InitialNotificationsLoadingFailed ||
              state is MoreNotificationsLoadingFailed) {
            return const Center(
              child: Text('Failed to load notifications'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.appPrimary,
              ),
            );
          }
        },
      ),
    );
  }
}

class NotificationListWidget extends StatelessWidget {
  final List<NotificationEntity> notifications;
  const NotificationListWidget({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        if (getNotificationType(notification.notificationType) ==
            NotificationType.followedYou) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    notification.userInvolved.profilePictureUrl ??
                        defaultProfilePicture),
              ),
              title: Text("${notification.userInvolved.name} followed you"),
              subtitle: Text(
                timeago.format(DateTime.fromMillisecondsSinceEpoch(
                    notification.timeStamp)),
              ),
            ),
          );
        } else if (getNotificationType(notification.notificationType) ==
            NotificationType.likeNotification) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    notification.userInvolved.profilePictureUrl ??
                        defaultProfilePicture),
              ),
              title: Text("${notification.userInvolved.name} liked your post"),
              subtitle: Text(
                timeago.format(DateTime.fromMillisecondsSinceEpoch(
                    notification.timeStamp)),
              ),
              trailing: CachedNetworkImage(
                imageUrl: notification.postInvolved?.imageUrl ??
                    defaultProfilePicture,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else if (getNotificationType(notification.notificationType) ==
            NotificationType.commentNotification) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    notification.userInvolved.profilePictureUrl ??
                        defaultProfilePicture),
              ),
              title: Text(
                  "${notification.userInvolved.name} commented on your post"),
              subtitle: Text(
                timeago.format(DateTime.fromMillisecondsSinceEpoch(
                    notification.timeStamp)),
              ),
              trailing: CachedNetworkImage(
                imageUrl: notification.postInvolved?.imageUrl ??
                    defaultProfilePicture,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
