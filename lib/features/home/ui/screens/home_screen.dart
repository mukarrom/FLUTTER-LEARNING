import 'package:flutter/material.dart';
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
      ),
      drawer: DrawerWidget(),
      body: Obx(
        () => controller.menuItems[controller.currentIndex.value]['widget'],
      ),
    );
  }
}
