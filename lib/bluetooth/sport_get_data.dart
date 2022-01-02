import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bluetooth {
  var today = 0;
  var thisWeek = 0;
  var record = 0;

  incrementToday() async {
    if (1 == 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      today = (prefs.getInt('counter') ?? 0) + 1;
      await prefs.setInt('counter', today);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var week = 0;
      await prefs.setInt('counter', week);
    }
  }

  incrementWeek() async {
    if (1 == 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      thisWeek = (prefs.getInt('counter') ?? 0) + 1;
      await prefs.setInt('counter', thisWeek);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var week = 0;
      await prefs.setInt('counter', week);
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

  getRecord() {
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
