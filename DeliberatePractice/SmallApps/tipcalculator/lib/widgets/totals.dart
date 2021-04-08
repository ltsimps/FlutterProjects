import 'package:flutter/material.dart';
import 'package:tipcalculator/models/calculator.dart';

class Totals extends StatelessWidget {
  final Calculator currentCalculation;

  Totals({required this.currentCalculation});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bill Total"),
            Text("${currentCalculation.returnTipAmount()}")
          ],
        ),
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Split Total"),
            Text(
                "${currentCalculation.splitAmt == 1 ? 0 : currentCalculation.returnTipAmount() / currentCalculation.splitAmt}")
          ],
        ),
      ),
    ]);
  }
}
