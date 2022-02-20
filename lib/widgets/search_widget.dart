import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_display/controllers/search_controller.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final String hintText;
  final SearchController searchController = Get.find<SearchController>();

  SearchWidget({
    Key key,
    @required this.text,
    @required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Center(
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white),
            suffixIcon: GestureDetector(
              child: Icon(Icons.close, color: Colors.white),
              onTap: () {
                widget.searchController.closeSearch();
              },
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.white,
          onChanged: widget.searchController.filterList,
        ),
      ),
    );
  }
}
