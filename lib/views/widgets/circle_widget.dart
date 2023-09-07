import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/styles/colors.dart';
import '../../constants/styles/text_styles.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    required this.imagePath,
    required this.index,
  });

  final String imagePath;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.0.w),
      height: 45.w,
      width: 45.w,
      decoration: BoxDecoration(
        color: kBlack1,
        borderRadius: BorderRadius.all(
          Radius.circular(90.r),
        ),
      ),
      child: Kstyles().reg14(text: index.toString(), color: kWhite),
    );
    // return Container(
    //   margin: EdgeInsets.all(8.0.w),
    //   padding: EdgeInsets.all(8.0.w),
    //   height: 45.w,
    //   width: 45.w,
    //   decoration: BoxDecoration(
    //     color: kBlack1,
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(90.r),
    //     ),
    //   ),
    //   child: Image.asset(imagePath),
    //   //'assets/images/Adani_logo_2012 1.png'
    // );
  }
}
