import 'package:flutter/material.dart';
import '../models/games.dart';

class ListItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  ListItem(this.title, this.imageUrl);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  // @override
  // void initState() {

  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
                  style: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                    icon: Icon(
                      isGameFavorite(widget.title)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.pink,
                    ),
                    onPressed: () {
                      setState(() {
                        toggleFavorite(widget.title);
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
