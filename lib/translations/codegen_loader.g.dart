// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> tr = {"app_name": "InPacket"};
  static const Map<String, dynamic> ku = {"app_name": "InPacket"};
  static const Map<String, dynamic> en = {
    "app_name": "InPacket",
    "borderTxt1": "Welcome to the InPaket App",
    "borderTxt2 ": "Your business is in your hands",
    "skip": "Skip",
    "start": "Start",
    "loginFacebook": "Sign up with Facebook",
    "loginGoogle": "Sign up with Google"
  };
  static const Map<String, dynamic> ar = {
    "app_name": "InPacket",
    "borderTxt1": "اهلا وسهلا بكم في تطبيق InPaket",
    "borderTxt2": "جميع ما تطلبه بين يديك",
    "skip": "تخطي",
    "start": "إبدأ",
    "loginFacebook": "تسجيل الدخول عبر الفيسبوك",
    "loginGoogle": "تسجيل الدخول عبر Google"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "tr": tr,
    "ku": ku,
    "en": en,
    "ar": ar,
  };
}
