import 'package:flutter/material.dart';

class FirstFormModel extends ChangeNotifier {
  String? _date;
  String? _time; 
  String? _menu;
  int? _kCal;

  get date => this._date;

  set date(value) {
    this._date = value;
    notifyListeners();
  }

  get time => this._time;

  set time(value) {
    this._time = value;
    notifyListeners();
  }


  get menu => this._menu;

  set menu(value) {
    this._menu = value;
    notifyListeners();
  }

  get kCal => this._kCal;

  set kCal(value) {
    this._kCal = value;
    notifyListeners();
  }
}