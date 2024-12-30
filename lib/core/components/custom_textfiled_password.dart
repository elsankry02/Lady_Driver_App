import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextfiledPassword extends StatefulWidget {
  const CustomTextfiledPassword(
      {super.key, required this.labelText, required this.suffixIcon});
  final String labelText;
  final String suffixIcon;

  @override
  State<CustomTextfiledPassword> createState() =>
      _CustomTextfiledPasswordState();
}

class _CustomTextfiledPasswordState extends State<CustomTextfiledPassword> {
  bool isSelcted = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextField(
      keyboardType: TextInputType.number,
      style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
      obscureText: isSelcted ? true : false,
      decoration: InputDecoration(
        suffixIcon: UnconstrainedBox(
          child: SvgPicture.asset(widget.suffixIcon),
        ),
        //! isSelctedIcon
        prefixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isSelcted = !isSelcted;
            });
          },
          child: UnconstrainedBox(
            child: SvgPicture.asset(
              isSelcted ? 'assets/svg/eye-off.svg' : 'assets/svg/eye.svg',
            ),
          ),
        ),
        hintText: widget.labelText,
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
