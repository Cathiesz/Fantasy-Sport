// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/sport-math.dart';

SportMath sportSquat = SportMath(0, 0, false, "Squat");
SportMath sportPushup = SportMath(0, 0, false, "Pushup");

class SportData {
  static final getData = [
    {
      'name': 'Squats',
      'index': '1',
      'symbol': 'How often can you Squat?',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sportSquat.getRecord(),
      'This Week': sportSquat.getThisWeek(),
      'Today': sportSquat.getToday(),
    },
    {
      'name': 'Pushups',
      'index': '2',
      'symbol': 'Push your Limit up',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sportPushup.getRecord(),
      'This Week': sportPushup.getThisWeek(),
      'Today': sportPushup.getToday(),
    },
  ];
}
