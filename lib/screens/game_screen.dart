import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class GameScreen extends StatefulWidget {
  final String title;
  final String gameUrl;
  static const routeName = '/game-screen';
  GameScreen(this.title, this.gameUrl);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    flutterWebviewPlugin.onDestroy;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _landscapeGames = [
      'Xibalba',
      'Missile Game',
      'Colonist.io',
      'Snail Bob',
      'Swooop',
      'Stickman Skate',
      'Cut the Rope Time Travel',
      'Paper Flight',
      'Conduct This',
      'Google\'s Packman',
      'Adam eve 4',
      'Adam and eve Zombies',
      'Dumb ways to die',
      'Basketball Stars',
      'Will Hero',
      'Stickman Archer',
      'Penalty Shooters',
      'Moto X3',
      'Kung fu fight',
      'Apple Shooter',
      'Stickman Army-Defenders',
      'Plane Fight',
      'Fruit Chop',
      'Knight Ride',
      'Snake King',
      'Zombies can\'t Jump',
      'Snakes & Ladders',
      'City Cricket',
    ];
    if (_landscapeGames.contains(widget.title)) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }

    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
          url: widget.gameUrl,
          clearCache: true,
          appCacheEnabled: true,
          withLocalStorage: true,
          initialChild: Center(
            child: CircularProgressIndicator(),
          ),
          scrollBar: false,
        ),
      ),
    );
  }
}
