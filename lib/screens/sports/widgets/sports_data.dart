// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../bluetooth/sport_get_data.dart';

SportGetData sport = new SportGetData();

class SportData {
  static final getData = [
    {
      'name': 'Spinning',
      'index': '1',
      'symbol': 'How often can you spin?',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sport.getRecord(),
      'This Week': sport.getThisWeek(),
      'Today': sport.getToday(),
    },
    {
      'name': 'Squads',
      'index': '2',
      'symbol': 'How often can you Squad?',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sport.getRecord(),
      'This Week': sport.getThisWeek(),
      'Today': sport.getToday(),
    },
    {
      'name': 'Pushups',
      'index': '3',
      'symbol': 'Push Bitch',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sport.getRecord(),
      'This Week': sport.getThisWeek(),
      'Today': sport.getToday(),
    },
  ];
}
