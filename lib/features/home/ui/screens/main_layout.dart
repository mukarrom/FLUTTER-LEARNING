import 'package:flutter/material.dart';
import 'package:flutter_learning/features/home/ui/screens/home_screen.dart';
import 'package:flutter_learning/features/stripe_payment_gatway/stripe_payment_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  static const route = '/main-layout';

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [HomeScreen(), StripePaymentScreen()];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.payment), label: 'Stripe'),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}
