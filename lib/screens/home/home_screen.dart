import 'package:first_challenge/widgets/nft_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/NftModel.dart';
import '../../models/NftsProvider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    _initializeData();
    super.didChangeDependencies();
  }

  _initializeData() async {
    if (!_isInitialized) {
      await Provider.of<NftsProvider>(context, listen: false).getMftsList();
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ntfsProvider = Provider.of<NftsProvider>(context);
    var ntfsList = ntfsProvider.nftsList;

    return Scaffold(
      appBar: AppBar(title: const Text("Fist flutter Challenge")),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          ntfsProvider.clearList();
          await ntfsProvider.getMftsList();
        },
        child: Center(
          child: ntfsList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      ),
                    ])
              : ListView.builder(
                  itemCount: ntfsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NftItem(
                      ntfsList[index] ?? NftModel(),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
