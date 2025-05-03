import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/features/firebase/authentication/auth_services.dart';
import 'package:flutter_learning/features/firebase/authentication/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Center(
              child: Text('Register New Account', style: style.titleLarge),
            ),

            _buildFormSection(),

            _buildButtonsSection(),

            TextButton(
              onPressed: () {
                Get.to(() => LoginScreen());
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Column(
      spacing: 16,
      children: [
        ElevatedButton(
          child: Text('Register'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _register();
            }
          },
        ),
        Row(
          spacing: 16,
          children: [
            Expanded(child: Divider(thickness: 2)),
            Text('Or'),
            Expanded(child: Divider(thickness: 2)),
          ],
        ),
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Google Sign Up'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Facebook Sign Up'),
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

  void _register() async {
    try {
      final UserCredential? result = await authServices.value
          .registerWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
      if (result?.user?.uid != null) {
        Get.snackbar(
          'Success',
          'User registered successfully',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Error',
          'User registration failed',
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
