import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

@RoutePage()
class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: const TextStyle(fontSize: 55),
              AppLocalizations.of(context)!.helloMassage('Medo'),
            ),
          ],
        ),
      ),
    );
  }
}
