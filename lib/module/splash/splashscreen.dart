import 'package:floor_demo/module/splash/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: FlutterLogo(
              size: 400,
            ),
          ),
        );
      },
    );
  }
}