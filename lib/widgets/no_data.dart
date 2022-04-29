import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inpaket/Configers/configers.dart';

Center widgetNoData(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(noData),
        Text(
          "OOPs!!",
          // 'Oops! Its Empty!',
          style: const TextStyle(
            color: Color(0xff23203F),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
            height: 10.h
        ),
        Text(
           "Nn Datails Found",
          // 'There are no products under this\ncategory right now.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff23203F),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}