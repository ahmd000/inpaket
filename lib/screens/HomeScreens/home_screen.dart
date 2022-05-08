import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/screens/HomeScreens/HomePagesScreens/favorite_screen/favorate_food_screen.dart';
import 'package:inpaket/screens/HomeScreens/HomePagesScreens/ProfileSetting/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inpaket/widgets/text_app.dart';

import 'HomePagesScreens/drawer_dcreen/drawer_screen.dart';
import 'HomePagesScreens/home_page/home_product.dart';
import 'HomePagesScreens/orders_screen/order_food_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  User? user = FirebaseAuth.instance.currentUser;
  String name = "";
  String email = "";
  String mobileNumber = "";
  String imageURL = "";

  static final List _homeNamesScreens = [
    TextApp(
      text: "appName".tr,
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
    TextApp(
      text: "orders".tr,
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
    TextApp(
      text: "favorite".tr,
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
    TextApp(
      text: "profile".tr,
      fontSize: 20.sp,
      fontColor: mainColor,
      fontWeight: FontWeight.bold,
    ),
  ];

  static const List<Widget> _homePageScreens = <Widget>[
    MainHomeScreen(),
    OrderFoodScreen(),
    FavoriteFoodScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser != null) {
      print("uid: ${FirebaseAuth.instance.currentUser!.uid}");
    } else {
      print("uid: No UID");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search_screen");
              },
              icon: Icon(
                Icons.search,
                color: mainColor,
              )),
          user!= null ?  IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart_screen");
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: mainColor,
              )):Container(),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 32.sp,
            color: mainColor,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: _homeNamesScreens.elementAt(page),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: isLoading == false
          ? Container(
              // color: Colors.blueAccent,
              child: _homePageScreens.elementAt(page),
            )
          : const Center(
              child: CircularProgressIndicator(),
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
                  text: "appName".tr,
                ),
                GButton(
                  icon: Icons.store,
                  text: "orders".tr,
                ),
                GButton(
                  icon: Icons.favorite,
                  text: "favorite".tr,
                ),
                GButton(
                  icon: Icons.person,
                  text: "profile".tr,
                ),
              ],
              selectedIndex: page,
              onTabChange: (index) {
                setState(() {
                  page = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
