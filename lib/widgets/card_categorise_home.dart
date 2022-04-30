import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCategoriseHome extends StatelessWidget {
  const CardCategoriseHome({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xffF0F1F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 200.h,
            width: double.infinity,
            child: Image.asset(
              image,
              // 'assets/images/Clip.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffdec9b5),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            height: 50.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    // "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    // textAlign: TextAlign.right,
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18.sp,
                      color: const Color(0xff503e05),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
