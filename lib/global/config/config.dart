import 'package:flutter/material.dart';

import '../../main.dart';

class Config {
  //*--------------------------------- (Base_URL)
  String baseUrl = 'https://www.alphavantage.co/';

  String apiKey = '9F0MIH1Q43DNIFSF';
}

//*--------------------------------- (Global Context)
BuildContext globalContext = navigationKey.currentState!.context;
//*----------------------------------(Media_Query)
Size size = MediaQuery.of(globalContext).size;
