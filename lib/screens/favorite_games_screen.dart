import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:connectivity/connectivity.dart';
import '../widgets/fav_item.dart';
import '../widgets/no_internet.dart';
import '../models/connectivity.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:web_display/models/ad_helper.dart';
import './main_drawer.dart';
import '../models/games.dart';
import '../screens/game_screen.dart';

class FavoriteGamesScreen extends StatefulWidget {
  static const routeName = '/fav-screen';

  @override
  _FavoriteGamesScreenState createState() => _FavoriteGamesScreenState();
}

class _FavoriteGamesScreenState extends State<FavoriteGamesScreen> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;
  BannerAd _bannerAd;
  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });

    FacebookAudienceNetwork.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(),
      request: AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    String _conectivityStatus;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        _conectivityStatus = "Offline";
        break;
      case ConnectivityResult.mobile:
        _conectivityStatus = "Online";
        break;
      case ConnectivityResult.wifi:
        _conectivityStatus = "Online";
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Favorites'),
          centerTitle: true,
        ),
        backgroundColor: Colors.amber,
        drawer: MainDrawer(),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(content: Text('Tap back again to leave')),
          child: favoriteGames.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: const Text(
                        'You dont have any favorite games, try adding some'),
                  ),
                )
              : _conectivityStatus == 'Online'
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (ctx, i) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return GameScreen(favoriteGames[i].title,
                                        favoriteGames[i].gameUrl);
                                  }));
                                },
                                child: FavItem(
                                  favoriteGames[i].title,
                                  favoriteGames[i].imageUrl,
                                ),
                              );
                            },
                            itemCount: favoriteGames.length,
                          ),
                        ),
                        if (_bannerAd != null)
                          Container(
                            height: 50,
                            child: AdWidget(ad: _bannerAd),
                          )
                      ],
                    )
                  : NoInternet(),
        ));
  }
}
