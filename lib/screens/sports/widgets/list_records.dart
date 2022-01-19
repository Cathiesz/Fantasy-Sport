import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';

var getData = CharData.getData;

class ListRecords extends StatefulWidget {
  _ListRecordsState recordList = _ListRecordsState();

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
    getData[_index]["beaten"] = beaten;
  }
}

class _ListRecordsState extends State<ListRecords> {
  MaterialColor _color = Colors.red;

  @override
  void initState() {
    super.initState();
    setBeaten();
  }

  setBeaten() {
    setState(() {
      //getData[widget._index]["beaten"] = widget.beaten;
      _color = getData[widget._index]["beaten"] == true
          ? Colors.lightGreen
          : Colors.red;
    });
  }

  String getBeatenStatusText(int index) {
    if (getData[index]["beaten"] == false) {
      return "Haven't beaten this buddy yet";
    }
    return "Congratulations on beating me!";
  }

  String getHavent(int index) {
    return getData[index]["beaten"] == true ? "have" : "haven't";
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
                            "${getBeatenStatusText(index)}\n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: _color),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "You ${getHavent(index)} beaten ${getData[index]["name"]}'s Challenge",
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
