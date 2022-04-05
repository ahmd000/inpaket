import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:inpaket/widgets/text_app.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        color: backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 214.h,
            ),
            Image(
              image: AssetImage(
                logoImage,
              ),
              fit: BoxFit.contain,
              width: 200.sp,
              height: 200.sp,
            ),
            SizedBox(
              height: 100.h,
            ),
            TextApp(
              text: LocaleKeys.appName.tr(),
              fontSize: 60.sp,
              fontColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
