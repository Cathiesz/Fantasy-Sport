import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/sport_get_data.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';
import 'package:hello_world/screens/informations/info_screen.dart';

Bluetooth bluetooth = Bluetooth();
var getData = CharData.getData;

class SportsWidget extends StatelessWidget {
  const SportsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.flame),
                    title: const Text('Highest Temperature Today',
                        style:
                            TextStyle(color: Colors.lightGreen, fontSize: 14)),
                    subtitle: Text(bluetooth.getHighestTemp()),
                  ),
                ),
                SizedBox(width: 8),
                const SizedBox(
                  height: 25,
                  child: VerticalDivider(
                    color: Colors.blueGrey,
                    thickness: 1,
                    indent: 2,
                    endIndent: 0,
                    width: 20,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.snow),
                    title: const Text(
                      'Lowest Temperature today',
                      style: TextStyle(
                        color: Colors.lightGreen,
                      ),
                    ),
                    subtitle: Text(bluetooth.getLowestTemp()),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
      Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          InkWell(
            splashColor: Colors.green.withAlpha(30),
            onTap: () {
              _navigateToNextScreen(context);
            },
            child: ListTile(
              title: Text(
                '${getData[1]['challenge-title']}',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
              subtitle: Text(
                  "\n\nCongratulations! You have accepted ${getData[1]['name']}'s chalenge! \nGood luck beating it! \n\n Your Record today is:" +
                      bluetooth.getSpins() +
                      "\n\n Your best score was:" +
                      bluetooth.getRecord().toString()),
            ),
          )
        ]),
      )
    ]);
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => InfoPage()));
}
