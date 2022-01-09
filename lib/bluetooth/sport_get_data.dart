import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bluetooth {
  var today = 0;
  var thisWeek = 0;
  var record = 0;

  incrementToday(String sport) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (1 == 0) {
      today = (prefs.getInt('today-' + sport) ?? 0) + 1;
      await prefs.setInt('today-' + sport, today);
    } else {
      var week = 0;
      await prefs.setInt('today-' + sport, week);
    }
  }

  incrementWeek(String sport) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (1 == 0) {
      thisWeek = (prefs.getInt('week-' + sport) ?? 0) + 1;
      await prefs.setInt('week-' + sport, thisWeek);
    } else {
      var week = 0;
      await prefs.setInt('week-' + sport, week);
    }
  }

  incrementRecord() async {
    if (today > record) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      record = (prefs.getInt('counter') ?? 0) + 1;
      await prefs.setInt('counter', record);
    }
  }

  getToday() {
    return today;
  }

  getThisWeek() {
    return thisWeek;
  }

  getRecord(String s) {
    if (today >= record) {
      record = today;
    }
    return 0;
  }

  getHighestTemp() {
    return "0";
  }

  getLowestTemp() {
    return "0";
  }

  String getPushups() {
    return "0";
  }

  String getSpins() {
    return "0";
  }
}
