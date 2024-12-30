import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key, required this.suffixIcon, required this.hintText});
  final String suffixIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextField(
      decoration: InputDecoration(
        suffixIcon: UnconstrainedBox(
          child: SvgPicture.asset(suffixIcon),
        ),
        hintText: hintText,
        hintStyle: textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder(),
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1.5,
        // ignore: use_full_hex_values_for_flutter_colors
        color: Color(0xff4d4d4d1a),
      ),
    );
  }
}
