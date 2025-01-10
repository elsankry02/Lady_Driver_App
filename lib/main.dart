import 'package:flutter/material.dart';
import 'package:lady_driver/core/cached/cached_helper.dart';
import 'package:lady_driver/core/constant/string_manager.dart';
import 'package:lady_driver/core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.getInstance();
  runApp(const LadyDriver());
}

class LadyDriver extends StatelessWidget {
  const LadyDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      theme: ThemeData(
        fontFamily: kTajawal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
