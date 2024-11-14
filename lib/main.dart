import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/routes.dart';
import 'package:health_app/view/scrren/homescrren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescrren(),
      getPages: getPages,
    );
  }
}
