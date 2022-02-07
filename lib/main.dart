import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import './screens/favorite_games_screen.dart';
import './screens/games_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcade Plaza',
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
      ),
      home: GamesListScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        FavoriteGamesScreen.routeName: (ctx) => FavoriteGamesScreen(),
        GamesListScreen.routeName: (ctx) => GamesListScreen(),
      },
    );
  }
}
