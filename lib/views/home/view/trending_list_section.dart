import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:investo/views/home/controller/home_controller.dart';
import 'package:investo/views/stock_detail/view/stock_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants/asset_constants.dart';
import '../../../constants/styles/text_styles.dart';
import '../../../global/config/config.dart';
import '../../widgets/market_list_tile.dart';

class TrendingListSection extends StatelessWidget {
  const TrendingListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeControl>(builder: (context, homeControl, _) {
      return SizedBox(
        width: size.width,
        //*--------------------(Api loading)
        child: homeControl.apiLoading == true
            ? SizedBox(
                height: size.height * 0.4,
                child: const SpinKitDualRing(
                  color: Colors.white,
                  size: 25.0,
                ),
              )
            //*--------------------(if response is not null oru is not empty show builder)
            : homeControl.marketListResp.mostActivelyTraded != null &&
                    homeControl.marketListResp.mostActivelyTraded!.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount:
                        homeControl.marketListResp.mostActivelyTraded?.length ??
                            0,
                    itemBuilder: (context, index) {
                      var data =
                          homeControl.marketListResp.mostActivelyTraded?[index];
                      return InkWell(
                        onTap: () {
                          //*---------------------------------(route to stock detail screen)
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StockDetailScreen(
                                    title: '${data?.ticker}',
                                    subTitle: '${data?.ticker}',
                                    price: double.parse(data?.price ?? "0"),
                                    percentage: data?.changePercentage ?? "0",
                                    redPrice:
                                        double.parse(data?.changeAmount ?? "0"),
                                    index: index + 1,
                                  )));
                        },
                        //*---------------------------------------(Market list tile)
                        child: MarketListTile(
                          title: '${data?.ticker}',
                          subTitle: '${data?.ticker}',
                          price: double.parse(data?.price ?? "0"),
                          imagePath: graphPic,
                          percentage: data?.changePercentage ?? "0",
                          index: index + 1,
                        ),
                      );
                    },
                  )
                //*----------------------------------------------(no data when the response is null or empty)
                : SizedBox(
                    height: size.height * 0.3,
                    child: Center(child: Kstyles().med16(text: "No data"))),
      );
    });
  }
}
