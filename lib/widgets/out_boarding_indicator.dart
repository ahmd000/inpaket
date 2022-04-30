import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Configers/configers.dart';

class OutBoardingIndicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  OutBoardingIndicator({
    required this.selected,
    this.marginEnd = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: selected ? 25.w : 15.w,
      height: 10,
      decoration: BoxDecoration(
        color: selected ? mainColor : lisbonBrownColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
