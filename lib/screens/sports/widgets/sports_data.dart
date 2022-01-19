// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/bluetooth/sport-math.dart';

SportMath sportSquat = SportMath("Squat");
SportMath sportPushup = SportMath("Pushup");

class SportData {
  static final getData = [
    {
      'name': 'Squats',
      'index': '1',
      'symbol': 'How often can you Squat?',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sportSquat.getRecord(),
      'Today': sportSquat.getToday(),
    },
    {
      'name': 'Pushups',
      'index': '2',
      'symbol': 'Push your Limit up',
      'icon': Icon(Icons.speed_outlined),
      'iconColor': Colors.orange,
      'Record': sportPushup.getRecord(),
      'Today': sportPushup.getToday(),
    },
  ];
}
