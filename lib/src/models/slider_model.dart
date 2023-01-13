import 'package:flutter/material.dart';

class SliderModel extends ChangeNotifier {

  double _currentPage = 0;
  
  double get currentPage => this._currentPage;
  
  set currentPage(double valor) {
    this._currentPage = valor;
    notifyListeners();
  }
  
}