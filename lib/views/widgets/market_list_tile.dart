import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investo/constants/asset_constants.dart';

import '../../constants/styles/colors.dart';
import '../../constants/styles/text_styles.dart';

class MarketListTile extends StatelessWidget {
  const MarketListTile({
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
    return Row(children: [
      //!--------------------------(circular rating index)
      Expanded(
          flex: 0,
          child: Container(
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
          )),
      Expanded(
        flex: 2,
        child: SizedBox(
          height: 60.h,
          // color: kRed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!------------------------------(title)
              Kstyles().med16(text: title, color: kWhite),
              //!------------------------------(sub-title)
              Kstyles().reg12(text: subTitle, color: kWhite),
            ],
          ),
        ),
      ),
      //!--------------------------(graph pic])
      Expanded(
        flex: 2,
        child: SizedBox(
          height: 60.h,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //*------------------------------(price)
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Kstyles()
                                  .reg12(text: "\$ ", color: kLightGrey)),
                          Flexible(
                              flex: 4,
                              child: Kstyles().med16(
                                  text: price.toStringAsFixed(2),
                                  color: kWhite)),
                        ],
                      ),
                    ),
                    //*------------------------------(percentage)
                    Flexible(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: const BoxDecoration(),
                            child: Image.asset(
                              stockUpPic,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 4,
                            child: Kstyles()
                                .med12(text: percentage, color: kGreen)),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
