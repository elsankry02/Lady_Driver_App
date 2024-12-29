import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.text,
    required this.color,
    required this.colorTextTheme,
  });

  final String text;
  final Color color;
  final Color colorTextTheme;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: textTheme.titleMedium!
              .copyWith(color: colorTextTheme, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
