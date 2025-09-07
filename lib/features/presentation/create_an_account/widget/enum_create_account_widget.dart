import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
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
    final appLocalizations = AppLocalizations.of(context)!;
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
                        ? AppColors.kPrimaryColor
                        : AppColors.kBorderColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                //! سائقة
                child: Text(
                  appLocalizations.femaleDriver,
                  style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isSelected == IsSelected.femaleDriver
                          ? AppColors.kPrimaryColor
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
                        ? AppColors.kPrimaryColor
                        : AppColors.kBorderColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                //! عميل
                child: Text(
                  appLocalizations.client,
                  style: textTheme.titleSmall!.copyWith(
                      color: isSelected == IsSelected.client
                          ? AppColors.kPrimaryColor
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
