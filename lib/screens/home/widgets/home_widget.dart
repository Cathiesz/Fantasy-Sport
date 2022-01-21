import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/chars.dart';
import 'package:hello_world/screens/home/bluetooth/bluetooth-info.dart';

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
              BluetoothInfo(
                intSlectedIndex: CharList.getState(),
              ),
            ],
          ),
        ));
  }
}
