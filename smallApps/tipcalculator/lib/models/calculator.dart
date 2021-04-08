import 'package:flutter/material.dart';

class Calculator {
  final amount;
  final tipPercentage;
  final splitAmt;

  Calculator(
      {this.tipPercentage = 0, this.splitAmt = 0, @required this.amount});

  double returnTipAmount() {
    print("Amount  $amount");
    return amount * tipPercentage;
  }
}
