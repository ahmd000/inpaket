import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/screens/HomeScreens/HomePagesScreens/favorate_food_screen.dart';
import 'package:inpaket/screens/HomeScreens/HomePagesScreens/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:inpaket/widgets/text_app.dart';

import 'HomePagesScreens/home_page/home_product.dart';
import 'HomePagesScreens/order_food_screen.dart';
import 'HomePagesScreens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // static TextStyle optionStyle = TextStyle(
  //   fontSize: 16.sp,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.black,
  // );

  static final List _homeNamesScreens = [
    TextApp(
      text: LocaleKeys.appName.tr(),
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
    TextApp(
      text: LocaleKeys.orders.tr(),
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
    // Text(
    //   'Orders',
    //   style: optionStyle,
    // ),
    TextApp(
      text: LocaleKeys.favorite.tr(),
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
    TextApp(
      text: LocaleKeys.profile.tr(),
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
  ];

  static const List<Widget> _homePageScreens = <Widget>[
    MainHomeScreen(),
   // SearchScreen(),
    OrderFoodScreen(),
    FavoriteFoodScreen(),
    ProfileScreen(),
  ];

  int _page = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(FirebaseAuth.instance.currentUser != null){
      print("uid: ${FirebaseAuth.instance.currentUser!.uid}");
    }else{
      print("uid: No UID");

    }


     // print(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 32.sp,
            color: mainColor,
          ),
          onPressed: () {
            // FirebaseAuth.instance.signOut();
            // print("Sign out Successfully") ;
            // Navigator.pushReplacementNamed(context, "/login_screen");
          },
        ),
        title: _homeNamesScreens.elementAt(_page),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        // color: Colors.blueAccent,
        child: _homePageScreens.elementAt(_page),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: mainColor,
              iconSize: 24.sp,
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
              duration: const Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey.shade400,
              color: mainColor,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: LocaleKeys.appName.tr(),
                ),
                GButton(
                  icon: Icons.store,
                  text: LocaleKeys.orders.tr(),
                ),
                GButton(
                  icon: Icons.favorite,
                  text: LocaleKeys.favorite.tr(),
                ),
                GButton(
                  icon: Icons.person,
                  text: LocaleKeys.profile.tr(),
                ),
              ],
              selectedIndex: _page,
              onTabChange: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
