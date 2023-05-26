import 'package:first_challenge/models/NftDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/NftsProvider.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = '/details';
  String? id;
  DetailsScreen({super.key, required this.id});

  static Route route(String id) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => DetailsScreen(
              id: id,
            ));
  }

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isInitialized = false;

  get id => this.id;

  @override
  void didChangeDependencies() {
    _initializeData();
    super.didChangeDependencies();
  }

  _initializeData() async {
    if (!_isInitialized) {
      await Provider.of<NftDetailsProvider>(context, listen: false)
          .getNftdetails(id ?? "");
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ntfDetailsProvider = Provider.of<NftDetailsProvider>(context);
    var ntfsDetails = ntfDetailsProvider.nftsDetails;
    return Container(
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Text(ntfsDetails?.description ?? ""),
        )
      ]),
    );
  }
}
