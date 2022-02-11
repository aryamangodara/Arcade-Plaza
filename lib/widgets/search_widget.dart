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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.black),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
                    child: Icon(Icons.close, color: Colors.black),
                    onTap: () {
                      widget.onReset();
                    },
                  )
                : SizedBox(),
            hintText: widget.hintText,
          ),
          cursorColor: Colors.black,
          onSubmitted: widget.onSubmitted,
        ),
      ),
    );
  }
}
