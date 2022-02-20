import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:web_display/controllers/search_controller.dart';
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
    // ignore: unused_local_variable
    SearchController searchController = Get.put(SearchController());

    return GetMaterialApp(
      title: 'Arcade Plaza',
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
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
