class NftModel {
  String? id;
  String? contract_address;
  String? name;
  String? asset_platform_id;
  String? symbol;

  NftModel(
      {this.id,
      this.contract_address,
      this.name,
      this.asset_platform_id,
      this.symbol});

  factory NftModel.fromJson(Map<String, dynamic> json) {
    return NftModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      contract_address: json['contract_address'],
      asset_platform_id: json['asset_platform_id'],
    );
  }
}
