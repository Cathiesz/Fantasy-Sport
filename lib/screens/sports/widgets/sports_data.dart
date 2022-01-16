// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/sport_get_data.dart';

Increment sport = Increment();

class SportData {
  static final getData = [
    {
      'name': 'Spinning',
      'index': '1',
      'symbol': 'How often can you spin?',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sport.getRecord("Spin"),
      'This Week': sport.getThisWeek(),
      'Today': sport.getToday(),
    },
    {
      'name': 'Squats',
      'index': '2',
      'symbol': 'How often can you Squat?',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sport.getRecord("Squat"),
      'This Week': sport.getThisWeek(),
      'Today': sport.getToday(),
    },
    {
      'name': 'Pushups',
      'index': '3',
      'symbol': 'Push your Limit up',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sport.getRecord("Pushup"),
      'This Week': sport.getThisWeek(),
      'Today': sport.getToday(),
    },
  ];
}
