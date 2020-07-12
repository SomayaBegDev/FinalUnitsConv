import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Constant.dart';

class ConvertorProvidor extends ChangeNotifier {
  String fromUnit = "";
  String toUnit = "";
  double textFieldValue = 1.0;
  String result = "0";
  int selectedIndex = 0;

  Map getSelectedMap() {
    return unitsNav[selectedIndex];
  }

  setSelectedIndex(int i) {
    this.selectedIndex = i;
    notifyListeners();
  }

  getSelectedUnit() {
    return unitsName[this.selectedIndex];
  }

  setFromUnit(String value) {
    this.fromUnit = value;
    calculate();
  }

  setToUnit(String value) {
    this.toUnit = value;
    calculate();
  }

  setValue(String myValue) {
    this.textFieldValue = double.parse(myValue);
    calculate();
  }

  calculate() {
    this.result =
        "${this.getSelectedMap()[toUnit] / this.getSelectedMap()[fromUnit] * textFieldValue}";
    notifyListeners();
  }
}
