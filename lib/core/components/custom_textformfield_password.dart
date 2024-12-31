import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';

class CustomTextFormFiledPassword extends StatefulWidget {
  const CustomTextFormFiledPassword(
      {super.key,
      required this.labelText,
      required this.suffixIcon,
      required this.controller,
      this.validator});
  final String labelText;
  final String suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

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
      keyboardType: TextInputType.number,
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
            child: SvgPicture.asset(
                isSelcted ? SvgManger.kEyeoff : SvgManger.kEye),
          ),
        ),
        hintText: widget.labelText,
        hintStyle: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
        border: outlineInputBorder(ColorManger.kBorderColor),
        enabledBorder: outlineInputBorder(ColorManger.kBorderColor),
        focusedBorder: outlineInputBorder(ColorManger.kBorderColor),
      ),
    );
  }

  outlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.5,
        color: borderColor,
      ),
    );
  }
}
