import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/chars.dart';
import 'package:hello_world/screens/sports/bluetooth/bluetooth-example.dart';

import 'char_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              CharacterShown(
                intSlectedIndex: CharList.getState(),
              ),
              //const BluetoothWidget(),
              BluetoothInfo(
                intSlectedIndex: CharList.getState(),
              ),
            ],
          ),
        ));
  }

  Widget _popUpDialog(BuildContext context) {
    return AlertDialog(
      title: Text("Congratulations!"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text("How did you beat me? You need to tell me your secret!")
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("close"))
      ],
    );
  }
}
