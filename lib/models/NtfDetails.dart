import 'package:first_challenge/models/ImageModel.dart';
import 'package:first_challenge/models/priceModel.dart';
import 'package:flutter/material.dart';

class NftDetails extends ChangeNotifier {
  String? description;
  String? name;
  ImageModel? image;
  String? symbol;
  PriceModel? price;

  NftDetails(
      {this.image, this.name, this.description, this.symbol, this.price});

  factory NftDetails.fromJson(Map<String, dynamic> json) {
    return NftDetails(
      description: json['description'],
      name: json['name'],
      symbol: json['symbol'],
      price: PriceModel.fromJson(json['floor_price']),
      image: ImageModel.fromJson(json["image"]),
    );
  }
}
