import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chars/chars.dart';
import '../sports/sports.dart';
import 'widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const CharsList(),
    SportsList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport with Buddies'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Character Selection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run_sharp),
            label: 'Sports',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
