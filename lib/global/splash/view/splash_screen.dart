import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/asset_constants.dart';
import '../../../constants/styles/colors.dart';
import '../../../views/bottom_nav/view/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // added future delay to show splash animation
    Future.delayed(const Duration(seconds: 3), () {
      // onSplash method is called
      onSplashLoad();
    });
  }

  void onSplashLoad() {
    // routes to Bottom nav
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const BottomNav(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Container(
        alignment: Alignment.center,
//*-----------------(App logo)
        child: Image.asset(
          appLogo,
          height: 60.h,
        )
            .animate()
            .fade(
                delay: const Duration(milliseconds: 100),
                duration: 700.ms,
                curve: Curves.easeInOut)
            .then()
            .fadeOut(
                delay: const Duration(milliseconds: 1000),
                duration: 700.ms,
                curve: Curves.easeInOut),
      ),
    );
  }
}
