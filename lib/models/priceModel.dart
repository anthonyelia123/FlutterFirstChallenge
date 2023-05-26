class PriceModel {
  int? native_currency;
  int? usd;

  PriceModel({this.usd, this.native_currency});

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      native_currency: json['native_currency'],
      usd: json['usd'],
    );
  }
}
