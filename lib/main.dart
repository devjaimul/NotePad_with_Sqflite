import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/views/splash_screen/splash_screen.dart';

import 'views/utlis/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
            iconTheme: const IconThemeData(color: Colors.white)
      )),
      home: const SplashScreen(),
    );
  }
}
