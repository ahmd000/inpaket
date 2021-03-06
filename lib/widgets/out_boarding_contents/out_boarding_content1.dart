import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:inpaket/Configers/configers.dart';
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
          Container(
            height: 320.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  outBoardingContent1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextApp(
            text:"borderTxt1".tr,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            fontColor: blackColor,
          ),

        ],
      ),
    );
  }
}
