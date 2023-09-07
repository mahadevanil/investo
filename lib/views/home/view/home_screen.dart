import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investo/constants/styles/colors.dart';
import 'package:investo/constants/styles/text_styles.dart';
import 'package:investo/views/home/view/watch_list_section.dart';
import 'package:provider/provider.dart';
import '../../../constants/asset_constants.dart';
import '../../../constants/ui_constants.dart';
import '../../../global/config/config.dart';
import '../../../global/widgets/space_h.dart';
import '../controller/home_controller.dart';
import 'gainer_list_section.dart';
import 'losers_list_section.dart';
import 'trending_list_section.dart';
import 'tab_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeControl>(context, listen: false).fetchMarketList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomeControl>(builder: (context, homeControl, _) {
        return Scaffold(
          //!--------------------------(App bar)
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kBlack,
            title: Image.asset(
              appLogo,
              height: 40.h,
            ),
            actions: [
              //*-----------------------------(notification icon)
              svgIcon(
                  ht: 25.h,
                  wd: 25.w,
                  color: kWhite,
                  assetImage: notificationIcon),
              //*------------------------------(search icon)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: svgIcon(
                    ht: 25.h, wd: 25.w, color: kWhite, assetImage: searchIcon),
              )
            ],
          ),
          backgroundColor: kBlack,
          //!-----------------------------(body)

          body: RefreshIndicator(
            displacement: 250,
            backgroundColor: kWhite,
            color: kBlack,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              homeControl.fetchMarketList();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  // physics: const BouncingScrollPhysics(),
                  children: [
                    //*-----------------------------(space)
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //!-----------------------------(trending text )
                        Flexible(
                            child: Kstyles()
                                .reg14(text: "Trending", color: kLightGrey)),
                      ],
                    ),
                    //!-----------------------------(space)
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    //!-----------------------------(watch-list scroll)

                    const WatchListSection(),
                    //!-----------------------------(space)
                    const SpaceH(
                      h: 0.04,
                    ),

                    TabSection(tabController: _tabController),
                    SizedBox(
                      height: size.height,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        controller: _tabController,
                        children: const [
                          //*--------------------------(Top trending list)
                          TrendingListSection(),
                          //*--------------------------(Top gainers list)
                          GainersListSection(),
                          //*--------------------------(Top losers list)
                          LosersListSection(),
                        ],
                      ),
                    ),

                    //!-----------------------------(space)
                    const SpaceH(
                      h: 0.015,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
