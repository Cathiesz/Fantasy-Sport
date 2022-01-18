import 'package:flutter/material.dart';
import 'package:hello_world/screens/sports/widgets/item_list.dart';

class ListRecords extends StatefulWidget {
  const ListRecords({Key? key}) : super(key: key);

  @override
  _ListRecordsState createState() => _ListRecordsState();
}

class _ListRecordsState extends State<ListRecords> {
  List<ListItem> lItems = [];

  getUpdate(int time, int record, int intSelected) {
    lItems.add(ListItem(time, record, intSelected));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: ListView.builder(
              itemCount: lItems.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return Container(child: lItems[Index]);
              })),
    );
  }
}
