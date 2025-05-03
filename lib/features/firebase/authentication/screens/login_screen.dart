import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/features/firebase/authentication/auth_services.dart';
import 'package:flutter_learning/features/firebase/authentication/screens/register_screen.dart';
import 'package:flutter_learning/features/firebase/authentication/screens/reset_password_screen.dart';
import 'package:flutter_learning/features/home/ui/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              Center(child: Text('Login', style: style.titleLarge)),
              _buildFormSection(),
              _buildLoginButtons(),
              TextButton(
                onPressed: () {
                  Get.to(() => RegisterScreen());
                },
                child: Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButtons() {
    return Column(
      spacing: 8,
      children: [
        ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _login();
            }
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Get.to(() => ResetPasswordScreen());
            },
            child: Text('Forgot Password?'),
          ),
        ),
        Row(
          spacing: 16,
          children: [
            Expanded(child: Divider(thickness: 2)),
            Text('Or'),
            Expanded(child: Divider(thickness: 2)),
          ],
        ),
        // google sign in button
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: ElevatedButton(
                child: Text('Google Sign In'),
                onPressed: () async {
                  // TODO: implement google sign in
                },
              ),
            ),
            // facebook sign in button
            Expanded(
              child: ElevatedButton(
                child: Text('Facebook Sign In'),
                onPressed: () async {
                  // TODO: implement facebook sign in
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
    );
  }

  void _login() async {
    try {
      final UserCredential? result = await authServices.value
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
      if (result?.user?.uid != null) {
        Get.to(() => HomeScreen());
      } else {
        Get.snackbar(
          'Error',
          'User Login failed',
          snackPosition: SnackPosition.TOP,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          e.code,
          e.message.toString(),
          snackPosition: SnackPosition.TOP,
        );
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          e.code,
          e.message.toString(),
          snackPosition: SnackPosition.TOP,
        );
        Logger().e('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          e.code,
          e.message.toString(),
          snackPosition: SnackPosition.TOP,
        );
        Logger().e(
          "Error on sign up: Error code: ${e.code} Error message: ${e.message}",
        );
      }
    }
  }
}
