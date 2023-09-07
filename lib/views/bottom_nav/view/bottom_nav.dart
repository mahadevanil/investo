import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investo/constants/styles/colors.dart';
import 'package:investo/constants/styles/text_styles.dart';
import 'package:investo/views/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:investo/views/home/view/home_screen.dart';
import 'package:provider/provider.dart';

import '../../market_list/view/market_list_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  List<Widget> myTabs = [
    const HomeScreen(),
    Center(child: Kstyles().med16(text: "Coming soon")),
    const MarketListScreen(),
    Center(child: Kstyles().med16(text: "Coming soon")),
    Center(child: Kstyles().med16(text: "Coming soon")),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavController>(builder: (context, navCtrl, _) {
      return Scaffold(
        backgroundColor: kBlack,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: myTabs,
        ),
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomAppBar(
            color: kBlack,
            child: TabBar(
              onTap: (value) {
                navCtrl.ontabChange(value);
              },
              indicator: UnderlineTabIndicator(
                  insets:
                      const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  borderSide: BorderSide(
                    color: kWhite,
                    width: 5.w,
                  )),
              labelColor: kWhite,
              unselectedLabelColor: const Color(0xff696C75),
              controller: tabController,
              tabs: navCtrl.tabList,
            ),
          ),
        ),
      );
    });
  }
}
