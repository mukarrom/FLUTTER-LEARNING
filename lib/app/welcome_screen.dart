import 'package:flutter/material.dart';
import 'package:flutter_learning/features/firebase/authentication/screens/login_screen.dart';
import 'package:flutter_learning/features/firebase/authentication/screens/register_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [
                Text(
                  'Welcome to Flutter Learning',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Text('Get Started'),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text('Sign In?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
