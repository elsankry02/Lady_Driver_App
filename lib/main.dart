import 'package:flutter/material.dart';
import 'package:lady_driver/views/splash/splash_view.dart';

void main() {
  runApp(const LadyDriver());
}

class LadyDriver extends StatelessWidget {
  const LadyDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
