import 'package:flutter_dotenv/flutter_dotenv.dart';

final String stipePublishableKey = dotenv.get(
  'STRIPE_PUBLISHABLE_KEY',
  fallback: '',
);
final String stipeSecretKey = dotenv.get('STRIPE_SECRET_KEY', fallback: '');
final String stripeApi = dotenv.get('STRIPE_API', fallback: '');
