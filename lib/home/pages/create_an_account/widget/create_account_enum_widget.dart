import 'package:flutter/material.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../l10n/app_localizations.dart';

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
                  AppLocalizations.of(context)!.femaleDriver,
                  style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isSelected == IsSelected.femaleDriver
                          ? ColorManger.kPrimaryColor
                          : Colors.black),
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
                  AppLocalizations.of(context)!.client,
                  style: textTheme.titleSmall!.copyWith(
                      color: isSelected == IsSelected.client
                          ? ColorManger.kPrimaryColor
                          : Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
