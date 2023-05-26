import 'package:dio/dio.dart';
import 'package:first_challenge/models/NftModel.dart';
import 'package:first_challenge/models/NtfDetails.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://api.coingecko.com/api/v3';

  Future<List<NftModel?>> getNfts() async {
    Response data = await _dio.get('$_baseUrl/nfts/list');

    List<dynamic> jsonData = data.data;

    List<NftModel?> nftsList =
        jsonData.map((json) => NftModel.fromJson(json)).toList();

    return nftsList;
  }

  Future<NftDetails?> getNftDetails(String id) async {
    Response data = await _dio.get('$_baseUrl/nfts/' + id);

    dynamic jsonData = data.data;

    NftDetails nftDetails = jsonData.map((json) => NftDetails.fromJson(json));

    return nftDetails;
  }
}
