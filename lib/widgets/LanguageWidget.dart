import 'package:admin_smarcap/Services/translation_service.dart';
import 'package:admin_smarcap/Utilities/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntrinsicHeight(
        child: Row(children: [
          InkWell(
            child: Text(
              'العربية',
              style: Get.theme.textTheme.headline1!.copyWith(
                  fontSize: 15.0,
                  color: TranslationService().isLocaleArabic()
                      ? AppColors.white
                      : AppColors.grey.withOpacity(0.5)),
            ),
            onTap: () {
              TranslationService().changeLocale('ar_SA');
            },
          ),
          const VerticalDivider(
            color: AppColors.black,
          ),
          InkWell(
              onTap: () {
                TranslationService().changeLocale('en_US');
              },
              child: Text(
                'English',
                style: Get.theme.textTheme.headline1!.copyWith(
                    fontSize: 15.0,
                    color: TranslationService().isLocaleArabic()
                        ? AppColors.grey.withOpacity(0.5)
                        : AppColors.white),
              )),
        ]),
      ).paddingSymmetric(horizontal: 42).marginOnly(top: 20),
    );
  }
}
