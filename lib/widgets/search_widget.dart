import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onSubmitted;
  final String hintText;
  final Function onReset;

  const SearchWidget({
    Key key,
    @required this.text,
    @required this.onSubmitted,
    @required this.hintText,
    @required this.onReset,
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
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white),
            suffixIcon: GestureDetector(
              child: Icon(Icons.close, color: Colors.white),
              onTap: () {
                widget.onReset();
              },
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: InputBorder.none,
          ),
          cursorColor: Colors.white,
          onSubmitted: widget.onSubmitted,
        ),
      ),
    );
  }
}
