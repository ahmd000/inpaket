import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/helpers/buttom_sheet_helper.dart';
import 'package:inpaket/prefs/shared_pref_controller.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
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
  // FirebaseService? _firebaseService;
  User? user = FirebaseAuth.instance.currentUser;
  bool isSwitched = false;
  late Position position;

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print("latitude: ${position.latitude}");
    print("longitude: ${position.longitude}");

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks.toString());

    setState(() {
      country = placemarks[0].country ?? LocaleKeys.unKnown.tr();
      postalCode = placemarks[0].postalCode ?? LocaleKeys.unKnown.tr();
      locality = placemarks[0].locality ?? LocaleKeys.unKnown.tr();
    });
  }

  getUserData() async {
    FirebaseFirestore.instance
        .collection(user!.uid)
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        setState(() {
          name = element.data()["name"];
          email = element.data()["email"];
          mobileNumber = element.data()["mobile_number"];
          imageURL = element.data()["image_url"];
          print("User Info: ${element.data()['mobile_number']}");
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: ListView(
          children: [
            Container(
              child: Row(
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
                              : LocaleKeys.appName.tr(),
                          fontSize: 24.sp,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.bold),
                      user!.displayName != null
                          ? TextApp(
                              text: "${user!.displayName}",
                              fontSize: 14.sp,
                              fontColor: Color(0xff8B8989),
                              fontWeight: FontWeight.bold)
                          : TextApp(
                              text: "",
                              fontSize: 14.sp,
                              fontColor: Color(0xff8B8989),
                              fontWeight: FontWeight.bold),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: TextApp(
                text: LocaleKeys.settingPanel.tr(),
                fontColor: Color(0xff8B8989),
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
              leading: Icon(Icons.location_on),
              trailing: Icon(Icons.navigate_next),
              title: TextApp(
                  text: LocaleKeys.location.tr(),
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
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.navigate_next),
              title: TextApp(
                  text: LocaleKeys.payment.tr(),
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
              leading: Icon(Icons.info_outline),
              trailing: Icon(Icons.navigate_next),
              title: TextApp(
                text: LocaleKeys.updateProfile.tr(),
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
              leading: Icon(Icons.security),
              trailing: Icon(Icons.navigate_next),
              title: TextApp(
                text: LocaleKeys.changePassword.tr(),
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
              leading: Icon(Icons.language),
              trailing: Icon(Icons.navigate_next),
              title: TextApp(
                text: LocaleKeys.language.tr(),
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
                text: LocaleKeys.notification.tr(),
                fontColor: Color(0xff8B8989),
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
                  : Icon(Icons.notifications),
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
                    ? LocaleKeys.activeNotification.tr()
                    : LocaleKeys.disActiveNotification.tr(),
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
                text: LocaleKeys.signOut.tr(),
                fontColor: Color(0xff8B8989),
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
                text: LocaleKeys.signOut.tr(),
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
        title: "",
        content: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                await context.setLocale(Locale('ar'));
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: LocaleKeys.arabic.tr(),
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: "اللغة العربية",
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                await context.setLocale(const Locale('en'));
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: LocaleKeys.english.tr(),
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: "English Language",
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
               // await context.setLocale(const Locale('tr'));
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: LocaleKeys.turkish.tr(),
                textAlign: TextAlign.start,
                fontColor: Colors.white,
              ),
              subtitle: TextApp(
                text: "Türkçe",
                fontColor: Colors.white,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
             //   await context.setLocale(const Locale('ku'));
              },
              iconColor: Colors.white,
              tileColor: mainColor,
              leading: const Icon(Icons.language),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
              focusColor: mainColor,
              title: TextApp(
                text: LocaleKeys.kurdish.tr(),
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
                text: LocaleKeys.country.tr(),
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
                text: LocaleKeys.locality.tr(),
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
                text: LocaleKeys.postalCode.tr(),
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
                text: LocaleKeys.update.tr(),
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
