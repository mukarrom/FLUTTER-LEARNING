import 'package:flutter/material.dart';
import 'package:flutter_learning/features/home/controllers/menu_items_controller.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItemsController = Get.put(MenuItemsController());
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            // menu items
            for (int i = 0; i < menuItemsController.menuItems.length; i++)
              ListTile(
                title: Text(menuItemsController.menuItems[i]['title']),
                dense: true,
                leading: Icon(menuItemsController.menuItems[i]['icon']),
                onTap: () {
                  menuItemsController.changeIndex(i);
                },
              ),
          ],
        ),
      ),
    );
    ;
  }

  Widget _buildHeader() {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.zero,
        image: DecorationImage(
          // image from unsplash
          image: NetworkImage(
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox.expand(
        child: Column(
          children: [
            Text(
              'Flutter Learning',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 10),
            Text('Version 1.0.0', style: TextStyle(fontSize: 12)),
            SizedBox(height: 10),
            Text(
              'Mukarrom Hosain',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
