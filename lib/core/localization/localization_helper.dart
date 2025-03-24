import 'package:get/get.dart';
import 'package:ntigradproject/core/cache_helper/cache-helper.dart';
import 'package:ntigradproject/core/cache_helper/cache_helper_keys.dart';
import 'package:ntigradproject/core/localization/app_string_keys.dart';

import '../cache_helper/chache_data.dart';
import 'ar.dart';
import 'en.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    CacheHelperKeys.keyAR: ar,
    CacheHelperKeys.keyEN: en,
  };

  static Future setLanguage() async {
    CacheData.lang = await CacheHelper.getData(key: CacheHelperKeys.langKey);

    if (CacheData.lang == null) {
      await CacheHelper.saveData(
        key: CacheHelperKeys.langKey,
        value: CacheHelperKeys.keyEN,
      );
      await Get.updateLocale(AppStringKeys.localeEN);
      CacheData.lang = CacheHelperKeys.keyEN;
    }
  }
}
