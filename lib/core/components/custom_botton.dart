import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.text,
    this.color,
    required this.textThemeColor,
    required this.borderColor,
  });

  final String text;
  final Color? color;
  final Color textThemeColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mediaQueryHeight * 0.060,
      width: mediaQueryWidth,
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
