import 'package:flutter/material.dart';

import '../../../../core/constant/color_manger.dart';
import '../../../../l10n/app_localizations.dart';

enum IsSelected { client, femaleDriver }

class EnumsCreateAccountWidget extends StatefulWidget {
  const EnumsCreateAccountWidget({super.key});

  @override
  State<EnumsCreateAccountWidget> createState() =>
      _EnumsCreateAccountWidgetState();
}

class _EnumsCreateAccountWidgetState extends State<EnumsCreateAccountWidget> {
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
              margin: const EdgeInsetsDirectional.only(end: 5),
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
              margin: const EdgeInsetsDirectional.only(start: 5),
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
