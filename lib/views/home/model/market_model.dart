// To parse this JSON data, do
//
//     final marketListModel = marketListModelFromJson(jsonString);

import 'dart:convert';

MarketListModel marketListModelFromJson(String str) =>
    MarketListModel.fromJson(json.decode(str));

class MarketListModel {
  String? metadata;
  String? lastUpdated;
  List<MostActivelyTraded>? topGainers;
  List<MostActivelyTraded>? topLosers;
  List<MostActivelyTraded>? mostActivelyTraded;

  MarketListModel({
    this.metadata,
    this.lastUpdated,
    this.topGainers,
    this.topLosers,
    this.mostActivelyTraded,
  });

  factory MarketListModel.fromJson(Map<String, dynamic> json) =>
      MarketListModel(
        metadata: json["metadata"],
        lastUpdated: json["last_updated"],
        topGainers: List<MostActivelyTraded>.from(
            json["top_gainers"].map((x) => MostActivelyTraded.fromJson(x))),
        topLosers: List<MostActivelyTraded>.from(
            json["top_losers"].map((x) => MostActivelyTraded.fromJson(x))),
        mostActivelyTraded: List<MostActivelyTraded>.from(
            json["most_actively_traded"]
                .map((x) => MostActivelyTraded.fromJson(x))),
      );
}

class MostActivelyTraded {
  String? ticker;
  String? price;
  String? changeAmount;
  String? changePercentage;
  String? volume;

  MostActivelyTraded({
    this.ticker,
    this.price,
    this.changeAmount,
    this.changePercentage,
    this.volume,
  });

  factory MostActivelyTraded.fromJson(Map<String, dynamic> json) =>
      MostActivelyTraded(
        ticker: json["ticker"] ?? "-",
        price: json["price"] ?? '-',
        changeAmount: json["change_amount"] ?? '-',
        changePercentage: json["change_percentage"] ?? "",
        volume: json["volume"] ?? '',
      );
}
