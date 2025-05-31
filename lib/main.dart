import 'package:flutter/material.dart';
import 'package:fourth_api_class/view/studentds_class.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentdsClass(),
    );
  }
}
