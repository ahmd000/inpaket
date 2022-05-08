import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:inpaket/prefs/shared_pref_controller.dart';
import 'package:inpaket/widgets/text_app.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final SharedPrefController _shPref = SharedPrefController();
  getFirstTimeOpen() {
    // _shPref.getFirstTimeOpen();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirstTimeOpen();
    Future.delayed(const Duration(seconds: 3), () {
      if (_shPref.firstTimeOpen == true) {
        Navigator.pushReplacementNamed(context, '/out_boarding_screen');
        setState(() {
          _shPref.firstTimeOpen = false;
          _shPref.sharedPref.setBool("firstTimeOpen", true);
          print("is First Time: ${_shPref.firstTimeOpen}");
        });
      } else {
        Navigator.pushReplacementNamed(context, '/home_screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        color: whiteColor,
        child: Column(
          children: [
            SizedBox(
              height: 270.h,
            ),
            Image(
              image: AssetImage(
                logoBrownImage,
              ),
              fit: BoxFit.contain,
              width: 200.sp,
              height: 200.sp,
            ),
            SizedBox(
              height: 30.h,
            ),
            TextApp(
              text: "appName".tr,
              fontSize: 60.sp,
              fontColor: mainColor,
            )
          ],
        ),
      ),
    );
  }
}
