import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:web_display/controllers/search_controller.dart';
import 'package:web_display/widgets/search_widget.dart';
import '../models/ad_helper.dart';
import '../widgets/no_internet.dart';
import '../models/connectivity.dart' show MyConnectivity;
import 'package:connectivity/connectivity.dart';
import './main_drawer.dart';
import '../models/games.dart';
import '../widgets/list_item.dart';
import './game_screen.dart';

class GamesListScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _GamesListScreenState createState() => _GamesListScreenState();
}

class _GamesListScreenState extends State<GamesListScreen> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;
  SearchController searchController = Get.find<SearchController>();

  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init();
    checkForUpdate();
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

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildSearch() => SearchWidget(
        text: searchController.query,
        hintText: 'Search',
      );

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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetBuilder<SearchController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title:
                controller.appBar ? const Text('Arcade Plaza') : buildSearch(),
            centerTitle: true,
            actions: [
              controller.appBar
                  ? IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        controller.pressSearch();
                      })
                  : SizedBox(),
            ],
          ),
          drawer: MainDrawer(),
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text('Tap back again to leave'),
            ),
            child: controller.allGames.length == 0
                ? Center(
                    child: Text(
                      'No games found!',
                      style: TextStyle(fontSize: 42),
                    ),
                  )
                : FutureBuilder(
                    future: fetchFavorites(),
                    builder: (ctx, snapshot) => snapshot.connectionState ==
                            ConnectionState.done
                        ? _conectivityStatus != 'Offline'
                            ? _updateInfo?.updateAvailability ==
                                    UpdateAvailability.updateAvailable
                                ? InAppUpdate.performImmediateUpdate()
                                : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          padding: const EdgeInsets.all(5),
                                          itemBuilder: (ctx, i) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (ctx) {
                                                  return GameScreen(
                                                      controller
                                                          .allGames[i].title,
                                                      controller
                                                          .allGames[i].gameUrl);
                                                }));
                                              },
                                              child: ListItem(
                                                controller.allGames[i].title,
                                                controller.allGames[i].imageUrl,
                                              ),
                                            );
                                          },
                                          itemCount: controller.allGames.length,
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
          backgroundColor: Colors.amber,
        );
      },
    );
  }
}
