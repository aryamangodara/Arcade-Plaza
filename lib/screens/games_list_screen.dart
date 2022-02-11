import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:web_display/widgets/search_widget.dart';
import '../models/ad_helper.dart';
import '../widgets/no_internet.dart';
import '../models/connectivity.dart' show MyConnectivity;
import 'package:connectivity/connectivity.dart';
import './main_drawer.dart';
import '../models/games.dart';
import '../widgets/list_item.dart';
import 'game_screen.dart';

class GamesListScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _GamesListScreenState createState() => _GamesListScreenState();
}

class _GamesListScreenState extends State<GamesListScreen> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;
  List<Game> gamesList = games;
  String query = '';

  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init();
    checkForUpdate();
    _loadInterstitialAd();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  AppUpdateInfo _updateInfo;
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    });
  }

  bool _isInterstitialAdLoaded = false;
  void _loadInterstitialAd() {
    print("ad load is called");
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: AdHelper.interstitialAdId,
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED) {
          print("ad is loaded");
          _isInterstitialAdLoaded = true;
        }

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        onSubmitted: filterList,
        hintText: 'Search',
        onReset: resetList,
      );

  void resetList() {
    setState(() {
      gamesList = games;
      this.query = '';
    });
  }

  void filterList(String query) {
    gamesList = games.where((game) {
      String gameTitle = game.title.toLowerCase();
      String queryLower = query.toLowerCase();

      return gameTitle.contains(queryLower);
    }).toList();
    setState(() {
      this.gamesList = gamesList;
      this.query = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_updateInfo);
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    print("update: $_updateInfo");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Arcade Plaza'),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: FutureBuilder(
            future: fetchFavorites(),
            builder: (ctx, snapshot) => snapshot.connectionState ==
                    ConnectionState.done
                ? _conectivityStatus != 'Offline'
                    ? _updateInfo?.updateAvailability ==
                            UpdateAvailability.updateAvailable
                        ? InAppUpdate.performImmediateUpdate()
                        : Column(
                            children: [
                              buildSearch(),
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(5),
                                  itemBuilder: (ctx, i) {
                                    return InkWell(
                                      onTap: () {
                                        if (_isInterstitialAdLoaded) {
                                          FacebookInterstitialAd
                                              .showInterstitialAd();
                                        } else {
                                          print("ad is not loaded");
                                        }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (ctx) {
                                          return GameScreen(gamesList[i].title,
                                              gamesList[i].gameUrl);
                                        }));
                                      },
                                      child: ListItem(
                                        gamesList[i].title,
                                        gamesList[i].imageUrl,
                                      ),
                                    );
                                  },
                                  itemCount: gamesList.length,
                                ),
                              ),
                              Container(
                                height: 50,
                                child: FacebookBannerAd(
                                  bannerSize: BannerSize.STANDARD,
                                  placementId: AdHelper.fbBannerAdId,
                                ),
                              )
                            ],
                          )
                    : NoInternet()
                : Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
          ),
        ),
        backgroundColor: Colors.amber);
  }
}
