import 'package:first_challenge/models/NftModel.dart';
import 'package:first_challenge/models/NtfDetails.dart';
import 'package:flutter/material.dart';

import '../config/dio_client.dart';

class NftDetailsProvider extends ChangeNotifier {
  NftDetails? nftsDetails = NftDetails();

  Future<void> getNftdetails(String id) async {
    var dioClient = DioClient();
    nftsDetails = await dioClient.getNftDetails(id);
    notifyListeners();
  }
}
