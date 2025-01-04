import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';

enum IsSelected { client, femaleDriver }

class CreateAccountEnumWidget extends StatefulWidget {
  const CreateAccountEnumWidget({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  State<CreateAccountEnumWidget> createState() =>
      _CreateAccountEnumWidgetState();
}

class _CreateAccountEnumWidgetState extends State<CreateAccountEnumWidget> {
  IsSelected isSelected = IsSelected.client;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              isSelected = IsSelected.femaleDriver;
            });
          },
          child: Expanded(
            child: Container(
              height: 48,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSelected == IsSelected.femaleDriver
                        ? ColorManger.kPrimaryColor
                        : ColorManger.kBorderColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                //! سائقة
                child: Text(
                  'سائقة',
                  style: widget.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              isSelected = IsSelected.client;
            });
          },
          child: Expanded(
            child: Container(
              height: 48,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSelected == IsSelected.client
                        ? ColorManger.kPrimaryColor
                        : ColorManger.kBorderColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                //! عميل
                child: Text(
                  'عميل',
                  style: widget.textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
