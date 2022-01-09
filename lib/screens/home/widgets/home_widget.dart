import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/chars.dart';

import 'bluetooth_card.dart';
import 'char_card.dart';
import 'sports_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CharacterShown(
            intSlectedIndex: CharList.getState(),
          ),
          const BluetoothWidget(),
          SportsWidget(
            intSlectedIndex: CharList.getState(),
          ),
        ],
      ),
    );
  }
}
