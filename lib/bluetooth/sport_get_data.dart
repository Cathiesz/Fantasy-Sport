import 'package:flutter/material.dart';

class SportGetData {
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
    return this.record;
  }
}
