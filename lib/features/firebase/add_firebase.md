# Step 1: Install the required command line tools

- If you haven't already, install the Firebase CLI.
  ```bash
  npm install -g firebase-tools
  ```

* Log into Firebase using your Google account by running the following command:

  ```bash
  firebase login
  ```

* Install the FlutterFire CLI by running the following command from any directory:
  ```bash
  dart pub global activate flutterfire_cli
  ```

# Step 2: Configure your apps to use Firebase

- Use the FlutterFire CLI to configure your Flutter apps to connect to Firebase.

- From your Flutter project directory, run the following command to start the app configuration workflow:
  `bash
    flutterfire configure
    `
  **What does this flutterfire configure workflow do?**

After this initial running of flutterfire configure, you need to re-run the command any time that you:
Start supporting a new platform in your Flutter app.
Start using a new Firebase service or product in your Flutter app, especially if you start using sign-in with Google, Crashlytics, Performance Monitoring, or Realtime Database.
Re-running the command ensures that your Flutter app's Firebase configuration is up-to-date and (for Android) automatically adds any required Gradle plugins to your app.

# Step 3: Initialize Firebase in your app

- From your Flutter project directory, run the following command to install the core plugin:
  ```bash
  flutter pub add firebase_core
  ```
- From your Flutter project directory, run the following command to ensure that your Flutter app's Firebase configuration is up-to-date:
  ```bash
  flutterfire configure
  ```
- In your `lib/main.dart` file, import the Firebase core plugin and the configuration file you generated earlier:
  ```dart
  import 'package:firebase_core/firebase_core.dart';
  import 'firebase_options.dart';
  ```
- Also in your `lib/main.dart` file, initialize Firebase using the DefaultFirebaseOptions object exported by the configuration file:
  ```dart
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  ```
- Rebuild your Flutter application:
  ```bash
  flutter run
  ```
- If you would rather use a demo project, you can start the Firebase Emulator and in your `lib/main.dart` file initialize Firebase using demoProjectId (it should start with demo-):
  ```dart
  await Firebase.initializeApp(
  demoProjectId: "demo-project-id",
  );
  ```
