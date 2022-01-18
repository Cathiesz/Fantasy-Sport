import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/bluetooth-example.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';

var getData = CharData.getData;

class ListItem extends StatefulWidget {
  int _record = 0;

  int _index = 0;

  int _time = DateTime.now().day;

  ListItem(int time, int record, int intSelected) {
    this._time = time;
    this._record = record;
    this._index = intSelected;
  }

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Row(
      children: [
        Icon(
          CupertinoIcons.rosette,
          size: 20,
          color: Colors.lightGreen,
        ),
        Column(
          children: <Widget>[
            Text("Congratz!\n",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.lightGreen)),
            Text("You beat ${getData[widget._index]["name"]}'s Challenge"),
            Text("Time of Defeat: ${widget._time}",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.grey)),
          ],
        ),
      ],
    )));
  }
}
