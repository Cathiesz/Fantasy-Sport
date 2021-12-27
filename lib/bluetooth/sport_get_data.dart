import 'package:flutter/material.dart';

class Bluetooth {
  var today = 0;
  var thisWeek = 0;
  var record = 0;

  getToday() {
    return this.today;
  }

  getThisWeek() {
    return this.thisWeek;
  }

  getRecord() {
    if (this.today >= this.record) {
      this.record = this.today;
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
