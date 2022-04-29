import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/widgets/text_app.dart';

mixin showDialogHelper {
  void showAlertDialog({
    required BuildContext context,
    required String title,
    String? body,

    Widget? content
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          actions: [
            TextButton(onPressed:() => Navigator.pop(context), child: TextApp(text: "OK",)),
          ],
          content: content,

          title: TextApp(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
            fontColor: Colors.blueAccent,
          ),
        );
      },
    );
  }
}