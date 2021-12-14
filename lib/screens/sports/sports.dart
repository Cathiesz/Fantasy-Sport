import 'package:flutter/material.dart';

class SingleSport {
  String sportTitle;
  var record;
  var today;
  var isFavorite = false;
  SingleSport(this.sportTitle, this.record, this.today, this.isFavorite);
}

List<SingleSport> sportList = [];
