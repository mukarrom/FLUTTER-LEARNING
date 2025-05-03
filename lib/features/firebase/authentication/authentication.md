# Firebase Authentication

[![Watch the video](https://img.youtube.com/vi/QSokvlp1o8U/maxresdefault.jpg)](https://youtu.be/QSokvlp1o8U?si=m2PrNGvFa2SuetNK)

<iframe width="560" height="315" src="https://www.youtube.com/embed/QSokvlp1o8U?si=FKeHr87Z12QDj3R1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Connect your app to Firebase

[Install and initialize the Firebase SDKs for Flutter](https://firebase.google.com/docs/flutter/setup) if you haven't already done so.

- Add Firebase Authentication to your app
  From the root of your Flutter project, run the following command to install the plugin:

      ```bash
      flutter pub add firebase_auth
      ```

- Once complete, rebuild your Flutter application:

  ```bash
  flutter run
  ```

- Import the plugin in your Dart code:

      ```dart
      import 'package:firebase_auth/firebase_auth.dart';
      ```

  To use an authentication provider, you need to enable it in the [Firebase console](https://console.firebase.google.com/?_gl=1*1k80ync*_ga*MTU1OTQ1ODQzMS4xNzQ0MDA3MjM3*_ga_CW55HF8NVT*MTc0NTEzNjMyNi4yNS4xLjE3NDUxMzg2OTQuNjAuMC4w). Go to the Sign-in Method page in the Firebase Authentication section to enable Email/Password sign-in and any other identity providers you want for your app.
