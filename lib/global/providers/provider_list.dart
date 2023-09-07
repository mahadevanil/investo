import 'package:investo/global/controller/global_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../views/bottom_nav/controller/bottom_nav_controller.dart';
import '../../views/home/controller/home_controller.dart';

List<SingleChildWidget> providerList = [
  //*--------------------------------------------(global controller)
  ChangeNotifierProvider(create: (context) => GlobalController()),
  //*--------------------------------------------(bottom_nav_controller)
  ChangeNotifierProvider(create: (context) => BottomNavController()),
  //*-----------------------------------(home_controller)
  ChangeNotifierProvider(create: (context) => HomeControl()),
];
