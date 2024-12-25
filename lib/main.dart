import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/const_manager.dart';
import 'package:lady_driver/views/splash_view.dart';

void main() {
  runApp(const LadyDriver());
}

class LadyDriver extends StatelessWidget {
  const LadyDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: kTajawal,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
