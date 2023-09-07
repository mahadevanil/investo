import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/asset_constants.dart';
import '../../../constants/styles/colors.dart';
import '../../../constants/ui_constants.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  //*------------------------------(Method used for getting index from bottom nav)
  ontabChange(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> get tabList {
    return [
      Tab(
          icon: svgIcon(
              ht: 25.h,
              wd: 25.w,
              color: kWhite,
              assetImage: unSelectedHomeIcon)),
      Tab(
          icon: svgIcon(
              ht: 25.h,
              wd: 25.w,
              color: kWhite,
              assetImage: unSelectedDocumentIcon)),
      Tab(
          icon: svgIcon(
              ht: 25.h,
              wd: 25.w,
              color: kWhite,
              assetImage: unSelectedChartIcon)),
      Tab(
          icon: svgIcon(
              ht: 25.h,
              wd: 25.w,
              color: kWhite,
              assetImage: unSelectedPieIcon)),
      Tab(
          icon: svgIcon(
              ht: 25.h,
              wd: 25.w,
              color: kWhite,
              assetImage: unSelectedSettingsIcon)),
    ];
  }
}
