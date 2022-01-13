import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:typed_data';

import 'package:hello_world/screens/chars/widgets/char_data.dart';

var getData = CharData.getData;

class BluetoothInfo extends StatefulWidget {
  var intSlectedIndex;

  BluetoothInfo({
    Key? key,
    required this.intSlectedIndex,
  }) : super(key: key);

  @override
  _BluetoothInfoState createState() => _BluetoothInfoState();

  getConnectionStatus() {}

  void getConnection() {}

  getSpins() {}

  getHeartrate() {}
}

class _BluetoothInfoState extends State<BluetoothInfo> {
  String _heartRate = "- bpm";
  double _bodyTemperature = 0;
  double _highestTemperature = 37;
  double _lowestTemperature = 37;

  String _accX = "-";
  String _accY = "-";
  String _accZ = "-";

  String _ppgGreen = "-";
  String _ppgRed = "-";
  String _ppgAmbient = "-";

  bool _isConnected = false;

  bool earConnectFound = false;
  String _connectionStatus = "Disconnected";

  double getHighestTemp() {
    return _highestTemperature;
  }

  double getLowestTemp() {
    return _lowestTemperature;
  }

  getSpins() {}

  getRecord(String s) {}

  getCurrentTemperature() {
    return _bodyTemperature;
  }

  getHeartrate() {
    return _heartRate;
  }

  void updateHeartRate(rawData) {
    Uint8List bytes = Uint8List.fromList(rawData);

    // based on GATT standard
    var bpm = bytes[1];
    if (!((bytes[0] & 0x01) == 0)) {
      bpm = (((bpm >> 8) & 0xFF) | ((bpm << 8) & 0xFF00));
    }

    var bpmLabel = "- bpm";
    if (bpm != 0) {
      bpmLabel = bpm.toString() + " bpm";
    }

    setState(() {
      _heartRate = bpmLabel;
    });
  }

  void updateBodyTemperature(rawData) {
    var flag = rawData[0];

    // based on GATT standard
    double temperature = twosComplimentOfNegativeMantissa(
            ((rawData[3] << 16) | (rawData[2] << 8) | rawData[1]) & 16777215) /
        100.0;
    if ((flag & 1) != 0) {
      temperature = ((98.6 * temperature) - 32.0) *
          (5.0 / 9.0); // convert Fahrenheit to Celsius
    }

    setState(() {
      _bodyTemperature = temperature; // todo update body temp
    });
  }

  void updatePPGRaw(rawData) {
    Uint8List bytes = Uint8List.fromList(rawData);

    // corresponds to the raw reading of the PPG sensor from which the heart rate is computed
    //
    // example plot https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/73/Screen-Shot-2019_2D00_01_2D00_24-at-19.30.24.png
    // (image just for illustration purpose, obtained from a different sensor! Sensor value range differs.)

    var ppg_red = bytes[0] |
        bytes[1] << 8 |
        bytes[2] << 16 |
        bytes[3] << 32; // raw green color value of PPG sensor
    var ppg_green = bytes[4] |
        bytes[5] << 8 |
        bytes[6] << 16 |
        bytes[7] << 32; // raw red color value of PPG sensor

    var ppg_green_ambient = bytes[8] |
        bytes[9] << 8 |
        bytes[10] << 16 |
        bytes[11] <<
            32; // ambient light sensor (e.g., if sensor is not placed correctly)

    setState(() {
      _ppgGreen = ppg_red.toString() + " (unknown unit)";
      _ppgRed = ppg_green.toString() + " (unknown unit)";
      _ppgAmbient = ppg_green_ambient.toString() + " (unknown unit)";
    });
  }

  void updateAccelerometer(rawData) {
    Int8List bytes = Int8List.fromList(rawData);

    // description based on placing the earable into your right ear canal
    int acc_x = bytes[14];
    int acc_y = bytes[16];
    int acc_z = bytes[18];

    setState(() {
      _accX = acc_x.toString() + " (unknown unit)";
      _accY = acc_y.toString() + " (unknown unit)";
      _accZ = acc_z.toString() + " (unknown unit)";
    });
  }

  int twosComplimentOfNegativeMantissa(int mantissa) {
    if ((4194304 & mantissa) != 0) {
      return (((mantissa ^ -1) & 16777215) + 1) * -1;
    }

    return mantissa;
  }

  void _connect() {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    // start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) async {
      // do something with scan results
      for (ScanResult r in results) {
        if (r.device.name == "earconnect" && !earConnectFound) {
          earConnectFound =
              true; // avoid multiple connects attempts to same device

          await flutterBlue.stopScan();

          r.device.state.listen((state) {
            // listen for connection state changes
            setState(() {
              _isConnected = state == BluetoothDeviceState.connected;
              _connectionStatus = (_isConnected) ? "Connected" : "Disconnected";
            });
          });

          await r.device.connect();

          var services = await r.device.discoverServices();

          for (var service in services) {
            // iterate over services
            for (var characteristic in service.characteristics) {
              // iterate over characterstics
              switch (characteristic.uuid.toString()) {
                case "0000a001-1212-efde-1523-785feabcd123":
                  print("Starting sampling ...");
                  await characteristic.write([
                    0x32,
                    0x31,
                    0x39,
                    0x32,
                    0x37,
                    0x34,
                    0x31,
                    0x30,
                    0x35,
                    0x39,
                    0x35,
                    0x35,
                    0x30,
                    0x32,
                    0x34,
                    0x35
                  ]);
                  await Future.delayed(new Duration(
                      seconds:
                          2)); // short delay before next bluetooth operation otherwise BLE crashes
                  characteristic.value.listen((rawData) =>
                      {updateAccelerometer(rawData), updatePPGRaw(rawData)});
                  await characteristic.setNotifyValue(true);
                  await Future.delayed(new Duration(seconds: 2));
                  break;

                case "00002a37-0000-1000-8000-00805f9b34fb":
                  characteristic.value
                      .listen((rawData) => {updateHeartRate(rawData)});
                  await characteristic.setNotifyValue(true);
                  await Future.delayed(new Duration(
                      seconds:
                          2)); // short delay before next bluetooth operation otherwise BLE crashes
                  break;

                case "00002a1c-0000-1000-8000-00805f9b34fb":
                  characteristic.value
                      .listen((rawData) => {updateBodyTemperature(rawData)});
                  await characteristic.setNotifyValue(true);
                  await Future.delayed(new Duration(
                      seconds:
                          2)); // short delay before next bluetooth operation otherwise BLE crashes
                  break;
              }
            }
            ;
          }
          ;
        }
      }
    });
  }

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
                    subtitle: Text("${getHighestTemp()} °C"),
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
                    subtitle: Text("${getLowestTemp()} °C"),
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
             
            },
            child: ListTile(
              title: Text(
                'Current Heartbeat',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text:
                      "\n  Your heartbeat currently is: ${getHeartrate()}",
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: getSpins(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen)),
                    TextSpan(text: "\n\n Your best score was: "),
                    TextSpan(
                        text:
                            "${getData[widget.intSlectedIndex]['record-number']} \n\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen))
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
      Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          InkWell(
            splashColor: Colors.green.withAlpha(30),
            child: ListTile(
              title: Text(
                '${getData[widget.intSlectedIndex]['challenge-title']}',
                style: TextStyle(
                  color: Colors.lightGreen,
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text:
                      "\nCongratulations! You have accepted ${getData[widget.intSlectedIndex]['name']}'s challenge! \nGood luck beating it! \n\n Your Record today is:",
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: getSpins(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen)),
                    TextSpan(text: "\n\n Your best score was: "),
                    TextSpan(
                        text:
                            "${getData[widget.intSlectedIndex]['record-number']} \n\n",
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
