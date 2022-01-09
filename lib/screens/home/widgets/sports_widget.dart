import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/sport_get_data.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';
import 'package:hello_world/screens/informations/info_screen.dart';

Bluetooth bluetooth = Bluetooth();
var getData = CharData.getData;

class SportsWidget extends StatefulWidget {
  const SportsWidget({Key? key}) : super(key: key);

  @override
  _SportsWidgetState createState() => _SportsWidgetState();
}

class _SportsWidgetState extends State<SportsWidget> {
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
                      style: TextStyle(color: Colors.lightGreen, fontSize: 14),
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
              subtitle: RichText(
                text: TextSpan(
                  text:
                      "\n\nCongratulations! You have accepted ${getData[1]['name']}'s challenge! \nGood luck beating it! \n\n Your Record today is:",
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: bluetooth.getSpins(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen)),
                    TextSpan(text: "\n\n Your best score was: "),
                    TextSpan(
                        text: bluetooth.getRecord().toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen))
                  ],
                ),
              ),
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
