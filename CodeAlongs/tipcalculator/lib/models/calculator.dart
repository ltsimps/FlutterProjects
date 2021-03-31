import 'package:flutter/material.dart';

class Calculator {
  final amount;
  final tipPercentage;

  Calculator(this.tipPercentage, {@required this.amount});

  double returnTipAmount() {
    return amount * tipPercentage;
  }
}
