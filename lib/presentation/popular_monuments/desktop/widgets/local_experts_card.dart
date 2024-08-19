import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monumento/domain/entities/local_expert_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalExpertsCard extends StatefulWidget {
  final List<LocalExpertEntity> localExperts;
  const LocalExpertsCard({super.key, required this.localExperts});

  @override
  State<LocalExpertsCard> createState() => _LocalExpertsCardState();
}

class _LocalExpertsCardState extends State<LocalExpertsCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Card(
      child: SizedBox(
        width: width * 0.26,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  widget.localExperts[index].imageUrl,
                ),
              ),
              title: Text(widget.localExperts[index].name),
              subtitle: Text(
                widget.localExperts[index].designation,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () async {
                  if (await canLaunchUrl(
                    Uri.parse('tel:${widget.localExperts[index].phoneNumber}'),
                  )) {
                    launchUrl(
                      Uri.parse(
                          'tel:${widget.localExperts[index].phoneNumber}'),
                    );
                  } else {
                    if (mounted) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                                "Contact ${widget.localExperts[index].name}"),
                            content: Text(
                                "You can contact ${widget.localExperts[index].name} at ${widget.localExperts[index].phoneNumber}"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: widget.localExperts.length,
        ),
      ),
    );
  }
}
