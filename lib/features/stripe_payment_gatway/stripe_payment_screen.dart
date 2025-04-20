import 'package:flutter/material.dart';
import 'package:flutter_learning/features/stripe_payment_gatway/stripe_service.dart';

class StripePaymentScreen extends StatelessWidget {
  const StripePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // material button
        child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Make Payment'),
          onPressed: () {
            StripeService.instance.makePayment(100, 'USD');
          },
        ),
      ),
    );
  }
}
