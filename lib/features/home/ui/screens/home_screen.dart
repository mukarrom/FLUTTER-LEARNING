import 'package:flutter/material.dart';
import 'package:flutter_learning/app/welcome_screen.dart';
import 'package:flutter_learning/features/firebase/authentication/auth_services.dart';
import 'package:flutter_learning/features/firebase/notification/notification_screen.dart';
import 'package:flutter_learning/features/home/controllers/menu_items_controller.dart';
import 'package:flutter_learning/features/home/ui/widgets/drawer_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MenuItemsController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            controller.menuItems[controller.currentIndex.value]['title'],
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
            icon: Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {
              authServices.value.signOut();
              Get.offAll(() => WelcomeScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      // body: Obx(
      //   () => controller.menuItems[controller.currentIndex.value]['widget'],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Home'),
        ),
      ),
    );
  }
}
