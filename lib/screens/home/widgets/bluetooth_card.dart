import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/bluetooth-example.dart';

BluetoothInfo bluetooth = new BluetoothInfo(
  intSlectedIndex: 1,
);

class BluetoothWidget extends StatefulWidget {
  const BluetoothWidget({Key? key}) : super(key: key);

  @override
  _BluetoothWidgetState createState() => _BluetoothWidgetState();
}

class _BluetoothWidgetState extends State<BluetoothWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.bluetooth_connected_rounded),
              title: Text('Bluetooth Connection',
                  style: TextStyle(color: Colors.lightGreen, fontSize: 14)),
              subtitle: Text(
                  'Your bluetooth device is ${bluetooth.getConnectionStatus()} \nDevice Name:'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Connect'),
                  onPressed: () {
                    bluetooth.getConnection();
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Disconnect'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
