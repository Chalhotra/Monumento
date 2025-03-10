<div align="center">
 <span>
 <img src="assets/cover.png" alt="Resonate logo" width="800" height="auto" />
 </span>
<br><br>

# Monumento 🌎

 </div>
 <div align="center">

[![Discord Follow](https://dcbadge.vercel.app/api/server/6mFZ2S846n?style=flat)](https://discord.gg/6mFZ2S846n) &ensp;&ensp;
[![License:GPL-3.0](https://img.shields.io/badge/License-GPL-yellow.svg)](https://opensource.org/license/gpl-3-0/)&ensp;&ensp;
![GitHub Org's stars](https://img.shields.io/github/stars/AOSSIE-Org/monumento?style=social)

</div>
Monumento is an AR-integrated social app that transforms how you connect with the world’s most iconic landmarks. Through Monumento, you can check in to popular monuments, explore famous sites, and discover new people, all within a social platform dedicated to cultural and historical experiences. Whether you're a traveler or a history enthusiast, Monumento offers an immersive way to engage with the world’s most treasured locations.

## 💻 Technologies Used

- Dart
- Flutter
- Firebase

## **▶️ How to run the Monumento app**

### 1) First clone the app into your local machine

- Follow these [guidelines](#step-1-️-how-to-setup-project-locally) to setup project locally

### 2) Then Configure Firebase

- Follw these [guidelines](#step-2-configure-firebase) to Configure Firebase

### 3) Adds the monuments Data

- Use these [guidelines](#step-3-populating-monument-data) to run a script which adds monuments data.

<a id="setup-project-locally"></a>

## Step 1) 🖥️ How to setup Project locally

Clone the project

```
  git clone https://github.com/AOSSIE-Org/Monumento.git
```

Go to the project directory

```
  cd Monumento
```

Install dependencies

```
  flutter pub get
```

Create `.env` using template `.env.template` and add API keys

```
cat .env.template > .env
```

Add the following API keys to the `.env` file

- `SERVER_CLIENT_ID`: Obtain this from the Google Cloud Console for Android configuration.
- `GOOGLE_SIGNIN_APPLE_CLIENT_ID`: Obtain this from the Google Cloud Console for iOS configuration.
- `GOOGLE_SIGNIN_WEB_CLIENT_ID`: Obtain this from the Google Cloud Console for web configuration.
- `GEOAPIFY_API_KEY`: Obtain this from the [Geoapify](https://www.geoapify.com/) website for fetching location.

Refer to the updated guide below for obtaining these API keys:

- [Google Cloud Console Guide](https://developers.google.com/identity) for Google Sign-In.
- [Geoapify API Setup](https://www.geoapify.com/get-started-with-maps-api/)

## Step 2) Configure Firebase

Follow the official [Firebase guide](https://firebase.google.com/docs/flutter/setup?platform=android) to set it up for this project. This will:

- Add the `google-services.json` file for Android.
- Add the `GoogleService-Info.plist` file for iOS and MacOS.
- Create the `firebase_options.dart` file in the lib folder.

## Step 3)📜 Populating Monument Data

This script allows you to populate your Firestore database with predefined monument data. It’s a standalone tool that you can run once to seed your database—no need to run or modify any Flutter app.

### Prerequisites

1. **Node.js**:
   Install Node.js from [https://nodejs.org](https://nodejs.org).
   Verify installation: node -v
   You should see a version number like i.e:

2. **Firebase Project with Firestore Enabled**:

- Go to [Firebase Console](https://console.firebase.google.com).
- Create or select a project.
- Enable Firestore.

3. **Service Account Key**:

- In the Firebase console, go to "Project Settings" → "Service accounts".
- Click "Generate new private key" to download `serviceAccountKey.json`.
- Save `serviceAccountKey.json` in app root directory inside scripts folder.



## **Step 4) Configure Google Sign-In (Web-Based Flutter App)**

To enable Google Sign-In, follow these steps:

1. **Enable Google People API**:
   - Go to the [Google Cloud Console](https://console.cloud.google.com/).
   - Enable the **Google People API** under the APIs & Services section.
   - Ensure you’ve signed up for the necessary services under your project.

2. **Set CORS Rules for Firebase Storage**:
   - If you encounter a `403 Forbidden` error when attempting to load images from Firebase Storage, configure your Firebase Storage bucket to allow CORS. Refer to this guide for more details: [Handling Firebase Storage 403 Error](https://stackoverflow.com/questions/41943860/getting-403-forbidden-error-when-trying-to-load-image-from-firebase-storage).

3. **Allow Access-Control-Allow-Origin**:
   - For viewing images on the web, ensure that the Firebase Storage bucket has the appropriate `Access-Control-Allow-Origin` settings. You can follow the steps here: [Configuring Access-Control-Allow-Origin](https://stackoverflow.com/questions/37760695/firebase-storage-and-access-control-allow-origin).

---

4. **Install Dependencies**:

- Install the Firebase Admin SDK:

```
npm install firebase-admin
```

inside scripts folder, execute the script using the following command:

```
node populate_monuments.js
```

If everything goes well, you should see:

```
Starting to populate the monuments collection...
Monuments collection populated successfully.
```

4. **Verify in firestore**:: Check the Firebase console → Firestore Database → monuments collection. Your data should appear there.

Notes:

- You can rerun this script whenever you need to seed the data.
- To add more monuments, modify the monumentsData array before running the script again.

## ✌️ Maintainers

- [Jaideep Prasad](https://github.com/jddeep)
- [Chandan S Gowda](https://github.com/chandansgowda)

## 🙌 Contributing

⭐ Don't forget to star this repository if you find it useful! ⭐

Thank you for considering contributing to this project! Contributions are highly appreciated and welcomed. To ensure a smooth collaboration, Refer to the [Contribution Guidelines](https://github.com/AOSSIE-Org/Monumento/blob/master/contributing.md).

We appreciate your contributions and look forward to working with you to make this project even better!

By following these guidelines, we can maintain a productive and collaborative open-source environment. Thank you for your support!

## 📍 License

Distributed under the [GNU General Public License](https://opensource.org/license/gpl-3-0/). See [LICENSE](https://github.com/AOSSIE-Org/Monumento/blob/master/LICENSE) for more information.

## 📫 Communication Channels

If you have any questions, need clarifications, or want to discuss ideas, feel free to reach out through the following channels:

[Discord Server](https://discord.com/invite/6mFZ2S846n)\
[Email](aossie.oss@gmail.com)

## Made by the Community, with ❤️

<a href="https://github.com/AOSSIE-Org/monumento/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=AOSSIE-Org/monumento" alt="Contributors"/>
</a>
<br>
