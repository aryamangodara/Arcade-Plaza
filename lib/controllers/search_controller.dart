import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:web_display/models/games.dart';

class SearchController extends GetxController {
  List<Game> allGames = games;
  bool appBar = true;
  String query = '';

  @override
  void onInit() {
    allGames = games;
    update();
    super.onInit();
  }

  void pressSearch() {
    appBar = false;
    update();
  }

  void filterList(String query) {
    allGames = games.where((game) {
      String gameTitle = game.title.toLowerCase();
      String queryLower = query.toLowerCase();

      return gameTitle.contains(queryLower);
    }).toList();
    this.allGames = allGames;
    this.query = query;
    update();
  }

  void closeSearch() {
    allGames = games;
    query = '';
    appBar = true;
    update();
  }
}
