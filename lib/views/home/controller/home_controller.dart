import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:investo/views/home/model/market_model.dart';
import 'package:investo/views/home/services/home_services.dart';

class HomeControl with ChangeNotifier {
  //*------------------------(Api loading )
  bool _apiLoading = false;
  //*----------------------------(market listing model class)
  MarketListModel marketListResp = MarketListModel();
  bool get apiLoading => _apiLoading;
  fetchMarketList() async {
    _apiLoading = true;
    notifyListeners();
    HomeServices().fetchMarketList().then((value) {
      log(value.statusCode.toString());
      if (value.statusCode == 200) {
        marketListResp = MarketListModel.fromJson(jsonDecode(value.body));

        _apiLoading = false;
        notifyListeners();
      } else {
        _apiLoading = false;
        notifyListeners();
      }
    });
  }

//*----------------------(bool for checking whether watchlisted or not)
  bool _isWatchListed = false;

  bool get isWatchListed => _isWatchListed;

//*---------------------(adding to watchlist click method)
  onstarClick() {
    _isWatchListed = !_isWatchListed;
    notifyListeners();
  }

  //*-----------------------------(onInit function)
  onInit() {
    _isWatchListed = false;
    notifyListeners();
  }
}
