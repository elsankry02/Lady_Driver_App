import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';

class CustomTextFormFiledPassword extends StatefulWidget {
  const CustomTextFormFiledPassword({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    required this.controller,
    this.validator,
    this.keyboardType,
  });
  final String hintText;
  final String suffixIcon;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormFiledPassword> createState() =>
      _CustomTextFormFiledPasswordState();
}

class _CustomTextFormFiledPasswordState
    extends State<CustomTextFormFiledPassword> {
  bool isSelcted = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
      obscureText: isSelcted ? true : false,
      decoration: InputDecoration(
        prefixIcon: UnconstrainedBox(
          child: SvgPicture.asset(widget.suffixIcon),
        ),
        //! isSelcted
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isSelcted = !isSelcted;
            });
          },
          //! EyeOff & Eye
          child: UnconstrainedBox(
            child: SvgPicture.asset(isSelcted ? AppSvgs.kEyeoff : AppSvgs.kEye),
          ),
        ),
        hintText: widget.hintText,
        hintStyle: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
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
