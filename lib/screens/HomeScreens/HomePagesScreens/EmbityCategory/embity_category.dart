import 'package:flutter/material.dart';
import 'package:inpaket/Configers/configers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget emptyCategory() => Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "wait to get best offers for you...",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32.sp, color: Colors.grey,),
        ),        Image(
          image: AssetImage(borderView3),
        )
      ],
    );
Widget searchCategory() => Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "wait to get best offers for you...",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32.sp, color: Colors.grey,),
        ),
        Image(
          image: AssetImage(borderView3),
        )
      ],
    );
