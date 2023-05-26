import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/NftModel.dart';
import '../screens/home/details_screen.dart';

class NftItem extends StatelessWidget {
  NftModel _nftModel;
  NftItem(this._nftModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DetailsScreen.routeName, arguments: _nftModel.id);
          },
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(_nftModel.symbol ?? ""),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(_nftModel.name ?? ""),
              )
            ],
          ),
        ),
      ),
    );
  }
}
