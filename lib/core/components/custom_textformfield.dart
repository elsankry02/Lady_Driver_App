import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.suffixIcon,
      required this.hintText,
      required this.controller,
      this.validator,
      this.keyboardType});
  final String suffixIcon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
        prefixIcon: UnconstrainedBox(child: SvgPicture.asset(suffixIcon)),
        border: outlineInputBorder(AppColors.kBorderColor),
        enabledBorder: outlineInputBorder(AppColors.kBorderColor),
        focusedBorder: outlineInputBorder(AppColors.kPrimaryColor),
      ),
    );
  }

  outlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1,
        color: borderColor,
      ),
    );
  }
}
