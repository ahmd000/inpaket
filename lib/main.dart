import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'get/language_getx_controller.dart';
import 'prefs/shared_pref_controller.dart';
import 'screens/HomeScreens/HomePagesScreens/ProfileSetting/change_password_screen.dart';
import 'screens/HomeScreens/HomePagesScreens/ProfileSetting/update_profile_screen.dart';
import 'screens/HomeScreens/home_screen.dart';
import 'screens/HomeScreens/search_food_screen.dart';
import 'screens/LoginAndRegisterScreens/forgit_password_screen.dart';
import 'screens/LoginAndRegisterScreens/login_screen.dart';
import 'screens/LoginAndRegisterScreens/register_screen.dart';
import 'screens/LoginAndRegisterScreens/reset_password.dart';
import 'screens/LoginAndRegisterScreens/verfiction_screen.dart';
import 'screens/out_boarding_screen.dart';
import 'screens/launch_screen.dart';
import 'translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    saveLocale: true,
    supportedLocales: const [
      Locale("ar"),
      Locale('en'),
      Locale("tr"),
      Locale("ku"),
    ],
    startLocale: Locale("ar"),
    path: 'assets/translations',
    assetLoader: CodegenLoader(),
    fallbackLocale: Locale('ar'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final LanguageGetXController _languageGetxController =
      Get.put<LanguageGetXController>(LanguageGetXController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: () {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.amber,
                primarySwatch: Colors.amber,
                fontFamily: "Roboto",
            ),
            initialRoute: '/launch_screen',
            routes: {
              '/launch_screen': (context) => const LaunchScreen(),
              '/out_boarding_screen': (context) => const OutBoardingScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/register_screen': (context) => const RegisterScreen(),
              '/home_screen': (context) => const HomeScreen(),
              "/search_screen": (context) => const SearchFoodScreen(),
              "/verify_screen": (context) => VerfictionScreen(
                    mobile: '',
                  ),
              "/forget_password_screen": (context) => const ForgetPassword(),
              "/reset_screen": (context) => ResetPassword(
                    mobile: '',
                  ),
              "/update_profile": (context) => UpdateProfileScreen(),
              "/change_password": (context) => ChangePasswordScreen(),
            },
          );
        });
  }
}
