import 'package:flutter_learning/features/stripe_payment_gatway/stripe_payment_screen.dart';
import 'package:flutter_learning/features/test/test_screen.dart';
import 'package:get/get.dart';

class MenuItemsController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Map<String, dynamic>> get menuItems => [
    {'title': 'Stripe Payment', 'widget': StripePaymentScreen()},
    {'title': 'Test', 'widget': TestScreen()},
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
