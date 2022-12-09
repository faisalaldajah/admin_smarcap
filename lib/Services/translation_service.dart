import 'dart:ui';
import 'package:admin_smarcap/Utilities/Lang/ar.dart';
import 'package:admin_smarcap/Utilities/Lang/en.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  
  static const locale =  Locale('ar', 'SA');

  static const fallbackLocale =  Locale('ar', 'SA');

  static final langs = [
    'en_US',
    'ar_SA',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'SA'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'ar_SA': ar,
      };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }

  bool isLocaleArabic (){
    return Get.locale == const Locale('ar', 'SA');
  }
}
