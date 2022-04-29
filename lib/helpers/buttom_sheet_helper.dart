import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/widgets/text_app.dart';

mixin buttonSheetHelper {
  showButtonSheet({
    required BuildContext context,
    required String title,
    Widget? content,
  }) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        context: context,
        elevation: 20.sp,
        isScrollControlled: false,
        enableDrag: false,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
              child: Column(
                children: [
                  TextApp(
                    text: title,
                  ),
                  Container(
                    child: content,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
