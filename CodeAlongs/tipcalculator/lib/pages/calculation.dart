import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Tip Calculator',
            style: TextStyle(color: Colors.white54),
          ),
          Text('Total'),
          TextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Bill total"),
              Text("Split Total"),
            ],
          ),
          Row()
        ],
      ),
    );
  }
}
