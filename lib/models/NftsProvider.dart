import 'package:first_challenge/models/NftModel.dart';
import 'package:flutter/material.dart';

import '../config/dio_client.dart';

class NftsProvider extends ChangeNotifier {
  List<NftModel?> nftsList = [];

  Future<void> getMftsList() async {
    nftsList.clear();
    var dioClient = DioClient();
    nftsList = await dioClient.getNfts();
    print(nftsList[0]?.name);
    notifyListeners();
  }

  void clearList() {
    nftsList.clear();
    notifyListeners();
  }
}
