import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:inpaket/widgets/text_app.dart';

class ListTileApp extends StatefulWidget {
  const ListTileApp({
    Key? key,
    required this.textTitle,
    this.iconTrailing,
    this.iconLeading,
    this.imageIcon,
  }) : super(key: key);

 final String textTitle;
 final Icon? iconTrailing;
 final Icon? iconLeading;
 final Image? imageIcon;

  @override
  State<ListTileApp> createState() => _ListTileAppState();
}

class _ListTileAppState extends State<ListTileApp> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.sp,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: ListTile(
        title: TextApp(
          text: widget.textTitle,
          textAlign: TextAlign.start,
          fontColor: mainColor,
        ),
        trailing: widget.iconTrailing,
        leading: widget.iconLeading?? widget.imageIcon,
        iconColor: mainColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.sp,
          vertical: 8.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
    );
  }
}
