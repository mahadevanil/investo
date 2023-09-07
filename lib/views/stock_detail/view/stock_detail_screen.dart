import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investo/global/config/config.dart';
import 'package:investo/global/widgets/space_h.dart';
import 'package:investo/views/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../constants/asset_constants.dart';
import '../../../constants/styles/colors.dart';
import '../../../constants/styles/text_styles.dart';
import '../../../constants/ui_constants.dart';
import '../widget/stock_title_tile.dart';

class StockDetailScreen extends StatefulWidget {
  const StockDetailScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.percentage,
      required this.redPrice,
      required this.index});
  //*-------------------(title)
  final String title;
  //*-------------------(subTitle)
  final String subTitle;
  //*-------------------(price)
  final double price;

  //*-------------------(percentage)
  final String percentage;
  //*-------------------(index)
  final int index;
  final double redPrice;

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  TabController? _tabController1;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController1 = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeControl>(context, listen: false).fetchMarketList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeControl>(builder: (context, homeControl, _) {
      return Scaffold(
        backgroundColor: kBlack,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBlack,
          leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios_rounded)),
          actions: [
            //*-----------------------------(notification icon)
            InkWell(
                onTap: () => homeControl.onstarClick(),
                child: homeControl.isWatchListed
                    ? Icon(
                        Icons.star_rounded,
                        color: kLightBlue,
                        size: 28.sp,
                      )
                    : Icon(
                        Icons.star_outline_rounded,
                        color: kWhite,
                        size: 28.sp,
                      )),
            //*------------------------------(search icon)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: svgIcon(
                  ht: 25.h, wd: 25.w, color: kWhite, assetImage: dotIcon),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SpaceH(h: 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: StockTitleTile(
                title: widget.title,
                subTitle: widget.subTitle,
                price: widget.price,
                percentage: widget.percentage,
                redPrice: widget.redPrice,
                index: widget.index,
              ),
            ),
            //!---------------------------------(space)
            const SpaceH(h: 0.025),
            //!--------------------------------(divider)
            Container(
              height: size.height * 0.005,
              color: kDarkGrey,
            ),
            Container(
              height: size.height * 0.05,
              color: kBlack,
            ),
            Container(
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
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: 5.h),
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
                    child: Kstyles().med14(text: "1D"),
                  ),

                  // second tab
                  Tab(
                    child: Kstyles().med13(text: "1W"),
                  ),
                  // third tab
                  Tab(
                    child: Kstyles().med13(text: "3M"),
                  ),
                  Tab(
                    child: Kstyles().med13(text: "6M"),
                  ),
                  Tab(
                    child: Kstyles().med13(text: "1Y"),
                  ),
                ],
              ),
            ),
            const SpaceH(h: 0.025),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(),
              child: Image.asset(
                graphPic,
                fit: BoxFit.contain,
              ),
            ),

            const SpaceH(h: 0.025),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Container(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03, vertical: 5.h),
                        controller: _tabController1,
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
                            child: Kstyles().med13(text: "Overview"),
                          ),

                          // second tab
                          Tab(
                            child: Kstyles().med13(text: "News"),
                          ),
                          // third tab
                          Tab(
                            child: Kstyles().med13(text: "Analytics"),
                          ),
                          Tab(
                            child: Kstyles().med13(text: "About"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w, vertical: 20.h),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: kWhite,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        fixedSize: Size(374.w, 55.h),
                      ),
                      child:
                          //  loader
                          //     ? const SpinKitThreeBounce(
                          //         color: kWhite,
                          //         size: 15.0,
                          //       )
                          // :
                          Kstyles().med18(text: "Buy Now", color: kBlack),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
