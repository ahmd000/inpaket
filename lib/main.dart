import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/localize_app/localize_app.dart';
import 'package:inpaket/screens/HomeScreens/HomePagesScreens/cart_screen/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localize_app/localize_controller.dart';
import 'prefs/shared_pref_controller.dart';
import 'screens/HomeScreens/HomePagesScreens/ProfileSetting/change_password_screen.dart';
import 'screens/HomeScreens/HomePagesScreens/ProfileSetting/update_profile_screen.dart';
import 'screens/HomeScreens/HomePagesScreens/search_screen/seartch_screen.dart';
import 'screens/HomeScreens/home_screen.dart';
import 'screens/LoginAndRegisterScreens/login_screen.dart';

import 'screens/out_boarding_screen.dart';
import 'screens/launch_screen.dart';

SharedPreferences? sharePref;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharePref = await SharedPreferences.getInstance();

  await Firebase.initializeApp();

  //

  runApp(MyApp());
}

Future initialServices() async {
  await Get.putAsync(() => SharedPrefController().init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LocalizeController localizeController = Get.put(LocalizeController());
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context) {
          return GetMaterialApp(
            locale: LocalizeController().initialLocale,
            translations: LocalizeApp(),
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            theme: ThemeData(
              // accentColor: whiteColor,
              primaryColor: whiteColor,
              fontFamily: "Roboto",
            ),
            // initialRoute:   "/home_screen",
            initialRoute: '/launch_screen',
            routes: {
              '/launch_screen': (context) => const LaunchScreen(),
              '/out_boarding_screen': (context) => const OutBoardingScreen(),
              '/login_screen': (context) => const LoginScreen(),
              '/home_screen': (context) => const HomeScreen(),
              '/cart_screen': (context) => const CartScreen(),
              "/update_profile": (context) => const UpdateProfileScreen(),
              "/change_password": (context) => const ChangePasswordScreen(),
              "/search_screen": (context) => const SearchScreen(),
            },
          );
        });
  }
}
