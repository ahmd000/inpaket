import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../Configers/configers.dart';
import 'text_app.dart';

class DialogCurrency extends StatefulWidget {
  const DialogCurrency({Key? key}) : super(key: key);

  @override
  State<DialogCurrency> createState() => _DialogCurrencyState();
}

class _DialogCurrencyState extends State<DialogCurrency> {
  String currency = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10.sp,
      alignment: AlignmentDirectional.centerStart,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
          side: BorderSide(
            color: mainColor,
            width: 5.sp,
          )),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextApp(
                text: "favoriteCurrency".tr,
                fontSize: 25.sp,
                fontColor: mainColor,
              ),
              RadioListTile<String>(
                title: TextApp(
                  text: "dollar".tr
                ),
                activeColor: mainColor,
                value: "dollar",
                groupValue: currency,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      currency = value;
                    });
                  }
                },
              ),
              RadioListTile<String>(
                title: TextApp(
                  text: "dinar".tr
                ),
                value: "Dinar",
                activeColor: mainColor,
                groupValue: currency,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      currency = value;
                    });
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        elevation: 10.sp,
                        fixedSize: const Size(0, 40),
                      ),
                      child: TextApp(
                        text: "ok".tr,
                        fontSize: 15.sp,
                        fontColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        elevation: 10.sp,
                        fixedSize: const Size(0, 40),
                      ),
                      child: TextApp(
                        text: "cancel".tr,
                        fontSize: 15.sp,
                        fontColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
