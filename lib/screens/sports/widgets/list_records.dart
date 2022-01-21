import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';

var getData = CharData.getData;

// ignore: must_be_immutable
class ListRecords extends StatefulWidget {
  _ListRecordsState recordList = _ListRecordsState();

  ListRecords({Key? key}) : super(key: key);

  @override
  _ListRecordsState createState() => _ListRecordsState();

  void setUpdate(String day, int record, int intSelected, bool beaten) {
    getData[intSelected]["beaten"] = beaten;
    getData[intSelected]["time"] = day;
  }
}

class _ListRecordsState extends State<ListRecords> {
  @override
  void initState() {
    super.initState();
  }

  MaterialColor getColor(int index) {
    return getData[index]["beaten"] == true ? Colors.lightGreen : Colors.red;
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
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Row(
          children: [
            Icon(
              CupertinoIcons.rosette,
              size: 20,
              color: getColor(index),
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
                              fontWeight: FontWeight.bold,
                              color: getColor(index)),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "You ${getHavent(index)} beaten ${getData[index]["name"]}'s Challenge",
                          textAlign: TextAlign.left,
                        ),
                        Text("Challenge: ${getData[index]["challenge-title"]}"),
                        Text(
                          "Date of first Win: ${getData[index]["time"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ));
      },
    );
  }
}
