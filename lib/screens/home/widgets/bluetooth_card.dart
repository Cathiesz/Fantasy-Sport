
import 'package:flutter/material.dart';
import 'package:hello_world/screens/sports/bluetooth/bluetooth-example.dart';


BluetoothInfo bluetooth = BluetoothInfo(
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
              leading: const Icon(Icons.bluetooth_connected_rounded),
              title: const Text('Bluetooth Connection',
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
