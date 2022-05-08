import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/widgets/text_app.dart';

mixin showDialogHelper {
  void showAlertDialog({
    required BuildContext context,
    required String title,
    Widget? content,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          scrollable: true,
          elevation: 10.sp,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.sp)),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: TextApp(
                  text: "OK",
                  fontColor: mainColor,
                )),
          ],
          content: content,
          title: TextApp(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
            fontColor: mainColor,
          ),
        );
      },
    );
  }
}
