import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/helpers/buttom_sheet_helper.dart';
import 'package:inpaket/localize_app/localize_controller.dart';
import 'package:inpaket/prefs/shared_pref_controller.dart';
import 'package:inpaket/widgets/text_app.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with buttonSheetHelper {
  String country = "";
  String locality = "";
  String postalCode = "";

  String name = "";
  String email = "";
  String mobileNumber = "";
  String imageURL = "";
  User? user = FirebaseAuth.instance.currentUser;
  bool isSwitched = false;
  late Position position;

  Future getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    print("latitude: ${position.latitude}");
    print("longitude: ${position.longitude}");

    List<Placemark> placemarks =
        // await placemarkFromCoordinates(31.5317683, 34.4988577);
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks.toString());
    setState(() {
      country =
          placemarks[0].country != "" ? placemarks[0].country! : "unKnown".tr;
      postalCode = placemarks[0].postalCode != ""
          ? placemarks[0].postalCode!
          : "unKnown".tr;
      locality =
          placemarks[0].locality != "" ? placemarks[0].locality! : "unKnown".tr;
    });

    return placemarks[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation(); //getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: ListView(
          children: [
            Row(
              children: [
                user!.photoURL != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage("${user!.photoURL}"),
                        minRadius: 30.sp,
                        maxRadius: 50.sp,
                      )
                    : CircleAvatar(
                        minRadius: 30.sp,
                        maxRadius: 50.sp,
                        child: Image(image: AssetImage(profileImage)),
                      ),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(
                        text: user!.phoneNumber != null
                            ? "${user!.phoneNumber}"
                            : "appName".tr,
                        fontSize: 24.sp,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.bold),
                    user!.displayName != null
                        ? TextApp(
                            text: "${user!.displayName}",
                            fontSize: 14.sp,
                            fontColor: const Color(0xff8B8989),
                            fontWeight: FontWeight.bold)
                        : TextApp(
                            text: "",
                            fontSize: 14.sp,
                            fontColor: const Color(0xff8B8989),
                            fontWeight: FontWeight.bold),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: TextApp(
                text: "settingPanel".tr,
                fontColor: const Color(0xff8B8989),
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ListTile(
              onTap: () {
                locationDetailButtonSheet(context);
              },
              leading: const Icon(Icons.location_on),
              trailing: const Icon(Icons.navigate_next),
              title: TextApp(
                  text: "location".tr,
                  textAlign: TextAlign.start,
                  fontSize: 15.sp,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.grey,
              endIndent: 30.sp,
              indent: 30.sp,
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              trailing: const Icon(Icons.navigate_next),
              title: TextApp(
                  text: "payment".tr,
                  textAlign: TextAlign.start,
                  fontSize: 15.sp,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.grey,
              endIndent: 30.sp,
              indent: 30.sp,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/update_profile");
              },
              leading: const Icon(Icons.info_outline),
              trailing: const Icon(Icons.navigate_next),
              title: TextApp(
                text: "updateProfile".tr,
                textAlign: TextAlign.start,
                fontSize: 15.sp,
                fontColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey,
              endIndent: 30.sp,
              indent: 30.sp,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/change_password");
              },
              leading: const Icon(Icons.security),
              trailing: const Icon(Icons.navigate_next),
              title: TextApp(
                text: "changePassword".tr,
                // "Change Password",

                fontSize: 15.sp,
                fontColor: Colors.black,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey,
              endIndent: 30.sp,
              indent: 30.sp,
            ),
            ListTile(
              onTap: () {
                languageButtonSheet(context);
              },
              leading: const Icon(Icons.language),
              trailing: const Icon(Icons.navigate_next),
              title: TextApp(
                text: "language".tr,
                fontSize: 15.sp,
                fontColor: Colors.black,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey,
              endIndent: 30.sp,
              indent: 30.sp,
            ),
            SizedBox(
              height: 32.h,
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: TextApp(
                text: "notification".tr,
                fontColor: const Color(0xff8B8989),
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ListTile(
              leading: isSwitched == true
                  ? Icon(
                      Icons.notifications_active,
                      color: mainColor,
                    )
                  : const Icon(Icons.notifications),
              trailing: Switch(
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                value: isSwitched,
              ),
              title: TextApp(
                text: isSwitched == true
                    ? "activeNotification".tr
                    : "disActiveNotification".tr,
                fontSize: 15.sp,
                fontColor: Colors.black,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey,
              endIndent: 30.sp,
              indent: 30.sp,
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: TextApp(
                text: "signOut".tr,
                fontColor: const Color(0xff8B8989),
                fontSize: 15.sp,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ListTile(
              onTap: () async {
                // bool status = await AuthApiController().logout();

                FirebaseAuth.instance.signOut();

                await SharedPrefController().clear();

                Navigator.pushReplacementNamed(context, '/login_screen');
              },
              leading: const Icon(Icons.logout_sharp),
              trailing: const Icon(Icons.navigate_next),
              title: TextApp(
                text: "signOut".tr,
                fontSize: 15.sp,
                fontColor: Colors.black,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey,
              endIndent: 30.sp,
              indent: 30.sp,
            ),
          ],
        ),
      ),
    );
  }

  void languageButtonSheet(BuildContext context) {
    showButtonSheet(
        context: context,
        title: "language".tr,
        content: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                // await context.setLocale(Locale('ar'));

                LocalizeController().changeLocale("ar");
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: "arabic".tr,
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: "اللغة العربية",
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 20.sp),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                LocalizeController().changeLocale("en");
                //await context.setLocale(const Locale('en'));
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: "english".tr,
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: "English Language",
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 20.sp),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                // LocalizeController().changeLocale("tu");
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: "turkish".tr,
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: "Türkçe",
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 20.sp),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                // LocalizeController().changeLocale("ku");
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: "kurdish".tr,
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: "Zimanê Kurdî",
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
          ],
        ));
  }

  locationDetailButtonSheet(BuildContext context) {
    showButtonSheet(
        context: context,
        title: "",
        content: Column(
          children: [
            ListTile(
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.location_city_sharp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: country.tr,
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: country,
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            ListTile(
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.location_city_sharp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: locality.tr,
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: locality,
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            ListTile(
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.location_city_sharp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: postalCode.tr,
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: postalCode,
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
              onPressed: () => getLocation(),
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                elevation: 15.sp,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 10.sp,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
              child: TextApp(
                text: "update".tr,
                fontColor: Colors.white,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ));
  }
}
