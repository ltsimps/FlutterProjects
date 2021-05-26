import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  RandomizerPage({Key? key, required int this.min, required int this.max})
      : super(key: key);
  final min;
  final max;

  @override
  _RandomizerPageState createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Range: ${widget.min}  ->  ${widget.max}",
              style: TextStyle(fontSize: 42, color: Colors.blue[500]),
            ),
            SizedBox(
              height: 55,
            ),
            Text(
              _generatedNumber?.toString() ?? 'Generate a Number',
              style: TextStyle(
                fontSize: 55,
                color: Colors.green[400],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Text('Generate'),
          onPressed: () {
            setState(() {
              _generatedNumber = widget.min +
                  randomGenerator.nextInt(widget.max + 1 - widget.min);
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
