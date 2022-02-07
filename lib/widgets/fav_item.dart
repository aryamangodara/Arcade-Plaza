import 'package:flutter/material.dart';

class FavItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  FavItem(this.title, this.imageUrl);

  @override
  _FavItemState createState() => _FavItemState();
}

class _FavItemState extends State<FavItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  widget.imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '',
                    textAlign: TextAlign.right,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.pink),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
