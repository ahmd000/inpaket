import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:inpaket/Configers/configers.dart';

import 'package:inpaket/widgets/text_app.dart';

class OutBoardingContent2 extends StatelessWidget {
  const OutBoardingContent2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 320.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                image: DecorationImage(
                  image: AssetImage(
                    outBoardingContent2,
                  ),
                )),
          ),
          TextApp(
            text: "borderTxt2".tr,
            // text: LocaleKeys.borderTxt2.tr(),
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            fontColor: blackColor,
          ),

        ],
      ),
    );
  }
}
