import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investo/global/controller/global_controller.dart';
import 'package:provider/provider.dart';

import 'global/providers/provider_list.dart';
import 'global/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
      providers: providerList,
      child: const ScreenUtilInit(
        designSize: Size(393, 852),
        child: MyApp(),
      )));
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalController>(
      builder: (context, globalCtrl, _) {
        return IgnorePointer(
          ignoring: globalCtrl.apiLoading,
          child: //*---------- if platform is IOS
              Platform.isIOS
                  ? CupertinoApp(
                      debugShowCheckedModeBanner: false,
                      title: 'INVESTO',
                      routes: routes,
                      initialRoute: '/',
                      navigatorKey: navigationKey,
                    )
                  //*-------  if platform is not IOS
                  : MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'INVESTO',
                      routes: routes,
                      initialRoute: '/',
                      navigatorKey: navigationKey,
                    ),
        );
      },
    );
  }
}
