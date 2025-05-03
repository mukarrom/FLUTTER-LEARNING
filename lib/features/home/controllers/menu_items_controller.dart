import 'package:flutter/material.dart';
import 'package:flutter_learning/features/firebase/authentication/screens/register_screen.dart';
import 'package:flutter_learning/features/firebase/firebase_home.dart';
import 'package:flutter_learning/features/stripe_payment_gatway/stripe_payment_screen.dart';
import 'package:flutter_learning/features/test/test_screen.dart';
import 'package:get/get.dart';

class MenuItemsController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Map<String, dynamic>> get menuItems => [
    {'title': 'register', 'icon': Icons.dashboard, 'widget': FirebaseHome()},
    {'title': 'register', 'icon': Icons.person, 'widget': RegisterScreen()},
    {
      'title': 'Stripe Payment',
      'icon': Icons.payment,
      'widget': StripePaymentScreen(),
    },
    {'title': 'Test', 'icon': Icons.dangerous, 'widget': TestScreen()},
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
