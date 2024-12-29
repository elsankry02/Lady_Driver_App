import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.text,
    required this.color,
    required this.textThemeColor,
    required this.borderColor,
  });

  final String text;
  final Color color;
  final Color textThemeColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(28),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: textTheme.titleMedium!
              .copyWith(color: textThemeColor, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
