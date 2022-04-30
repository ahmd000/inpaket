import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';

import 'prefs/shared_pref_controller.dart';
import 'screens/HomeScreens/HomePagesScreens/ProfileSetting/change_password_screen.dart';
import 'screens/HomeScreens/HomePagesScreens/ProfileSetting/update_profile_screen.dart';
import 'screens/HomeScreens/home_screen.dart';
import 'screens/HomeScreens/search_food_screen.dart';
import 'screens/LoginAndRegisterScreens/login_screen.dart';

import 'screens/out_boarding_screen.dart';
import 'screens/launch_screen.dart';
import 'translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initialServices();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    saveLocale: true,
    supportedLocales: const [
      Locale("ar"),
      Locale('en'),
      Locale("tr"),
      Locale("ku"),
    ],
    startLocale: const Locale("ar"),
    path: 'assets/translations',
    assetLoader: const CodegenLoader(),
    fallbackLocale: const Locale('ar'),
    child: MyApp(),
  ));
}

Future initialServices() async {
  await Get.putAsync(() => SharedPrefController().init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            theme: ThemeData(
              accentColor: whiteColor,
              primaryColor: whiteColor,
              primarySwatch: Colors.orange,
              fontFamily: "Roboto",
            ),
            // initialRoute:   "/home_screen",
            initialRoute: '/launch_screen',
            routes: {
              '/launch_screen': (context) => const LaunchScreen(),
              '/out_boarding_screen': (context) => const OutBoardingScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/home_screen': (context) => const HomeScreen(),
              "/search_screen": (context) => const SearchFoodScreen(),


              "/update_profile": (context) => const UpdateProfileScreen(),
              "/change_password": (context) => const ChangePasswordScreen(),
            },
          );
        });
  }
}
