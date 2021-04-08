import 'package:flutter/material.dart';

class Calculator {
  final amount;
  final tipPercentage;
  var splitAmt;

  Calculator(
      {this.tipPercentage = 0, this.splitAmt = 1, @required this.amount});

  double returnTipAmount() {
    if (splitAmt <= 0) {
      splitAmt = 1;
    }
    return (amount + (amount * tipPercentage / 100));
  }
}
