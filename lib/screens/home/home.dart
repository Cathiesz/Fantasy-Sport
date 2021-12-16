import 'package:flutter/material.dart';
import '../chars/chars.dart';
import './widgets/bluetoothCard.dart';
import './widgets/sportsWidget.dart';
import '../sports/sports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fantasy Sport'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.home_rounded),
            ),
            Tab(
              icon: Icon(Icons.directions_run_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Chars(),
          ),
          Center(
              child: new Column(
            children: [
              new BluetoothCard(),
              new SportCard(),
            ],
          )),
          Center(
            child: SportsList(),
          ),
        ],
      ),
    );
  }
}
