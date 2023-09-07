import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/asset_constants.dart';
import '../../constants/styles/colors.dart';
import '../../constants/styles/text_styles.dart';
import 'circle_widget.dart';

class WatchListCard extends StatelessWidget {
  const WatchListCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.percentage,
    required this.imagePath,
    required this.index,
  });
  //*-------------------(title)
  final String title;
  //*-------------------(subTitle)
  final String subTitle;
  //*-------------------(price)
  final double price;
  //*-------------------(image-path)
  final String imagePath;
  //*-------------------(percentage)
  final String percentage;
  //*-------------------(index)
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        border: Border.all(width: 1.5.w, color: kDarkGrey),
      ),
      width: 160.w,
      // height: 170,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      // height: size.height * 0.05,
      // color: kLightBlue,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //*---------------------------------(custom image circle)
              CircleWidget(
                imagePath: imagePath,
                index: index,
              ),
              Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //*------------------------------(title)
                      Kstyles().med16(text: title, color: kWhite),
                      //*------------------------------(sub-title)
                      Kstyles().reg12(text: subTitle, color: kWhite),
                    ],
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: kBlack1,
                ),
            child: Image.asset(
              graphPic,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Flexible(
                          child:
                              Kstyles().reg10(text: "\$ ", color: kLightGrey)),
                      Flexible(
                          flex: 3,
                          child: Kstyles().med14(
                              text: price.toStringAsFixed(2), color: kWhite)),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                          // padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          // height: 20.w,
                          // width: 20.w,
                          decoration: const BoxDecoration(
                              // color: kBlack1,
                              ),
                          child: Image.asset(
                            stockUpPic,
                            fit: BoxFit.contain,
                          ),
                          //'assets/images/Adani_logo_2012 1.png'
                        ),
                      ),
                      Flexible(
                          flex: 4,
                          child: Kstyles().med13(
                            overflow: TextOverflow.visible,
                            text: percentage,
                            maxLine: 1,
                            color: kWhite,
                          )),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
