import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:investo/views/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles/text_styles.dart';
import '../../../global/config/config.dart';
import '../../widgets/watch_list_card.dart';

class WatchListSection extends StatelessWidget {
  const WatchListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeControl>(builder: (context, homeControl, _) {
      return SizedBox(
        height: size.height * 0.2,
        width: size.width,
        // color: kRed,
        child: homeControl.apiLoading == true
            ? SizedBox(
                height: size.height * 0.4,
                child: const SpinKitDualRing(
                  color: Colors.white,
                  size: 25.0,
                ),
              )
            : homeControl.marketListResp.mostActivelyTraded != null &&
                    homeControl.marketListResp.mostActivelyTraded!.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        homeControl.marketListResp.mostActivelyTraded?.length ??
                            0,
                    itemBuilder: (context, index) {
                      var data =
                          homeControl.marketListResp.mostActivelyTraded?[index];

                      return WatchListCard(
                        index: index + 1,
                        title: '${data?.ticker}',
                        subTitle: '${data?.ticker}',
                        price: double.parse(data?.price ?? "0"),
                        imagePath: 'assets/images/Adani_logo_2012 1.png',
                        percentage: data?.changePercentage ?? "0 %",
                      );
                    },
                  )
                : SizedBox(
                    height: size.height * 0.3,
                    child: Center(child: Kstyles().med16(text: "No data"))),
      );
    });
  }
}
