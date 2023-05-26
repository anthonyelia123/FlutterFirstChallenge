import 'package:first_challenge/models/NftsProvider.dart';
import 'package:first_challenge/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_router.dart';
import 'models/NftDetailsProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NftsProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => NftDetailsProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fist Flutter Challenge',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Avenir',
              textTheme: const TextTheme()),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ));
  }
}
