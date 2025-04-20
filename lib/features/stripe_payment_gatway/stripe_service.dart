import 'dart:convert';

import 'package:flutter_learning/features/stripe_payment_gatway/constant.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class StripeService {
  final Logger logger = Logger(printer: PrettyPrinter());
  // singleton design pattern
  StripeService._();
  static final StripeService instance = StripeService._();

  // make payment
  Future<void> makePayment(int amount, String currency) async {
    try {
      // create payment intent
      final paymentIntent = await _createPaymentIntent(amount, currency);
      if (paymentIntent?['client_secret'] != null) {
        // confirm payment intent
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent?['client_secret'],
            merchantDisplayName: 'Flutter Stripe Demo',
          ),
        );
      }

      // display payment sheet
      await Stripe.instance.presentPaymentSheet();

      // clear payment intent
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      logger.d('Error: $e', stackTrace: StackTrace.current);
    }
  }

  // Create payment intent
  Future<Map<String, dynamic>?> _createPaymentIntent(
    int amount,
    String currency,
  ) async {
    try {
      Map<String, dynamic> body = {
        'amount': (amount * 100).toString(),
        'currency': currency,
      };
      final http.Response response = await http.post(
        Uri.parse('$stripeApi/payment_intents'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $stipeSecretKey',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        logger.d('Success: ${response.body}', stackTrace: StackTrace.current);
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      logger.d('Error: $e', stackTrace: StackTrace.current);
      return null;
    }
  }
}

// Future<PaymentMethod> createPaymentMethod(...);
// Future<PaymentIntent> handleNextAction(...);
// Future<PaymentIntent> confirmPayment(...);
// Future<void> configure3dSecure(...);
// Future<bool> isApplePaySupported();
// Future<void> presentApplePay(...);
// Future<void> confirmApplePayPayment(...);
// Future<SetupIntent> confirmSetupIntent(...);
// Future<PaymentIntent> retrievePaymentIntent(...);
// Future<String> createTokenForCVCUpdate(...);
// Future<void> initPaymentSheet(...);
// Future<void> presentPaymentSheet(...);
// Future<void> confirmPaymentSheetPayment()
