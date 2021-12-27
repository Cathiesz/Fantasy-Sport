import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/sport_get_data.dart';

Bluetooth bluetooth = Bluetooth();

class SportsWidget extends StatelessWidget {
  const SportsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
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
            const Divider(color: Colors.black),
            ListTile(
              title: const Text(
                'Amount of Push Ups',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
              subtitle: Text(bluetooth.getPushups()),
            ),
            const Divider(color: Colors.black),
            ListTile(
              leading: Icon(CupertinoIcons.arrow_2_circlepath_circle),
              title: const Text(
                'Amount of Spins',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
              subtitle: Text(bluetooth.getSpins()),
            ),
          ],
        ),
      ),
    );
  }
}
