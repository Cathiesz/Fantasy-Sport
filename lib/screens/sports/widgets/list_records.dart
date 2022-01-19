import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/sports/widgets/item_list.dart';

class ListRecords extends StatefulWidget {
  _ListRecordsState record = _ListRecordsState();

  int _record = 0;

  int _index = 0;

  String _time = "--";

  bool beaten = false;

  @override
  _ListRecordsState createState() => _ListRecordsState();

  void setUpdate(int day, int record, int intSelected, bool beaten) {
    this._time = day.toString();
    this._record = record;
    this._index = intSelected;
    this.beaten = beaten;
    this.record.setBeaten(beaten);
  }
}

class _ListRecordsState extends State<ListRecords> {
  MaterialColor _color = Colors.red;

  setBeaten(bool beaten) {
    setState(() {
      getData[widget._index]["beaten"] = widget.beaten;
      _color = widget.beaten ? Colors.lightGreen : Colors.red;
    });
  }

  String getBeatenStatusText() {
    if (widget.beaten == false) {
      return "Haven't beaten this buddy yet";
    }
    return "Congratulations on beating me!";
  }

  String getHavent() {
    return widget.beaten ? "have" : "haven't";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Row(
            children: [
              Icon(
                CupertinoIcons.rosette,
                size: 20,
                color: _color,
              ),
              Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 10,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${getBeatenStatusText()}\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: _color),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "You ${getHavent()} beaten ${getData[index]["name"]}'s Challenge",
                            textAlign: TextAlign.left,
                          ),
                          Text(
                              "Challenge: ${getData[index]["challenge-title"]}"),
                          Text(
                            "Time of Defeat: ${widget._time}",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ))
                ],
              ),
            ],
          ));
        },
      ),
    );
  }
}
