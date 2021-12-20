import 'package:flutter/material.dart';

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
          const BluetoothCard(),
          SportsWidget(),
          const CharacterShown(),
        ],
      ),
    );
  }
}
