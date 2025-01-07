import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';

enum IsSelected { client, femaleDriver }

class CreateAccountEnumWidget extends StatefulWidget {
  const CreateAccountEnumWidget({super.key});

  @override
  State<CreateAccountEnumWidget> createState() =>
      _CreateAccountEnumWidgetState();
}

class _CreateAccountEnumWidgetState extends State<CreateAccountEnumWidget> {
  IsSelected isSelected = IsSelected.client;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelected = IsSelected.femaleDriver;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              height: 48,
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
                  style: textTheme.titleSmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelected = IsSelected.client;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              height: 48,
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
                  style: textTheme.titleSmall!
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
