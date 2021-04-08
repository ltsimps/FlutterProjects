import 'package:flutter/material.dart';
import 'package:tipcalculator/models/calculator.dart';

class Totals extends StatelessWidget {
  final Calculator currentCalculation;

  Totals({required this.currentCalculation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bill Total",
                style: TextStyle(color: Colors.white54, fontSize: 20),
              ),
              Text(
                "${currentCalculation.returnTipAmount()}",
                style: TextStyle(color: Colors.white54, fontSize: 30),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Split Total",
                style: TextStyle(color: Colors.white54, fontSize: 20),
              ),
              Text(
                "${currentCalculation.splitAmt == 1 ? 0 : currentCalculation.returnTipAmount() / currentCalculation.splitAmt}",
                style: TextStyle(color: Colors.white54, fontSize: 25),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
