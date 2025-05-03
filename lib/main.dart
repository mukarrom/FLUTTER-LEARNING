import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_learning/app/app.dart';
import 'package:flutter_learning/firebase_options.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the .env file
  await dotenv.load(fileName: ".env");
  // Stripe publishable key
  Stripe.publishableKey = dotenv.get('STRIPE_PUBLISHABLE_KEY');
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(FlutterLearningApp());
}


//TODO: reset password
//TODO: update password
//TODO: delete account
//TODO: update user name
//TODO: google sign in
//TODO: facebook sign in