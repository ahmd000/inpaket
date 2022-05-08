import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inpaket/main.dart';
import 'package:inpaket/prefs/shared_pref_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizeController extends GetxController {
  Locale? initialLocale =
  sharePref?.getString("lang") == null
          ? Get.deviceLocale!
          :  Locale(sharePref!.getString("lang")!);
  void changeLocale(String codeLang) {
    Locale locale = Locale(codeLang);

   sharePref!.setString("lang", codeLang);

    Get.updateLocale(locale);
  }
}
