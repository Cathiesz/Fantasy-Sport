import 'package:flutter/material.dart';

class SportGetData {
  var today;
  var thisWeek;
  var record;

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
