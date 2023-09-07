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
import '../../home/controller/home_controller.dart';
import '../../home/view/gainer_list_section.dart';
import '../../home/view/losers_list_section.dart';
import '../../home/view/tab_section.dart';
import '../../home/view/trending_list_section.dart';

class MarketListScreen extends StatefulWidget {
  const MarketListScreen({super.key});

  @override
  State<MarketListScreen> createState() => _MarketListScreenState();
}

class _MarketListScreenState extends State<MarketListScreen>
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
            title: Kstyles().semiBold20(text: "Market"),
            actions: [
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
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //!-----------------------------(watchlist text )
                        Flexible(
                            child: Kstyles()
                                .reg14(text: "Watchlist", color: kLightGrey)),
                        //!-----------------------------(edit list text)
                        Flexible(
                            child: InkWell(
                          onTap: () async => homeControl.fetchMarketList(),
                          child: Kstyles()
                              .reg14(text: "Edit list", color: kLightBlue),
                        )),
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
