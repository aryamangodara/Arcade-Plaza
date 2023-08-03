import 'package:flutter/material.dart';
import './favorite_games_screen.dart';
import './games_list_screen.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: DrawerHeader(
              child: Center(
                child: Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Image(
                    image: AssetImage('dev_assets/ic_launcher.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.explore),
            title: const Text('Explore Games'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('My Favorites'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FavoriteGamesScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share App'),
            onTap: () {
              Share.share(
                'I play more than 50 awesome games on this app, that too without downloading: $url',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Rate Us'),
            onTap: () {
              _launchURL();
            },
          ),
          Expanded(child: const Text('')),
          const Text('Made with ❤ by Aryaman Godara')
        ],
      ),
    );
  }
}

const url =
    'https://play.google.com/store/apps/details?id=com.aryaman.arcade_plaza';
void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
