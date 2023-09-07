import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/styles/colors.dart';
import '../../../constants/styles/text_styles.dart';
import '../../../global/config/config.dart';

class TabSection extends StatelessWidget {
  const TabSection({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBlack2,
        // border: Border.all(color: kLightBlue),
        borderRadius: BorderRadius.circular(
          6.0.r,
        ),
      ),
      width: size.width,
      height: size.height * 0.054,
      child: TabBar(
        tabAlignment: TabAlignment.fill,
        isScrollable: false,
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 5.h),
        controller: _tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          color: kBlack,
          // border: Border.all(color: kLightBlue),
          borderRadius: BorderRadius.circular(
            8.0.r,
          ),
        ),
        tabs: [
          // first tab
          Tab(
            child: Kstyles().med14(text: "Trending"),
          ),

          // second tab
          Tab(
            child: Kstyles().med13(text: "Gainers"),
          ),
          // third tab
          Tab(
            child: Kstyles().med13(text: "Losers"),
          ),
        ],
      ),
    );
  }
}
