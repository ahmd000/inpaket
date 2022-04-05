import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/translations/locale_keys.g.dart';
import 'package:inpaket/widgets/text_app.dart';

class OutBoardingContent1 extends StatelessWidget {
  const OutBoardingContent1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          TextApp(
            text: LocaleKeys.borderTxt1.tr(),
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            fontColor: Colors.white,
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  logoWhiteImage,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextApp(
            text: LocaleKeys.appName.tr(),
            fontSize: 60.sp,
            fontColor: Colors.white,
          )
        ],
      ),
    );
  }
}
