import 'package:flutter/material.dart';
import 'package:flutter_learning/features/home/ui/screens/home_screen.dart';
import 'package:get/get.dart';

class FlutterLearningApp extends StatelessWidget {
  const FlutterLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
