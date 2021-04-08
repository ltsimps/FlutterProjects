import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tipcalculator/models/calculator.dart';
import 'package:tipcalculator/widgets/totals.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  late Calculator calc = Calculator(amount: 100.00);

  Calculator updateBillTotal(double amount, double percent, int split) {
    setState(() {
      calc =
          Calculator(amount: amount, tipPercentage: percent, splitAmt: split);
    });
    print("tip amount ${calc.returnTipAmount()}");
    return calc;
  }

  @override
  Widget build(BuildContext context) {
    double newAmt;
    double tipAmt;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffEB9079),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Tip Calculator',
                      style: TextStyle(color: Colors.white54, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Total',
                      style: TextStyle(color: Colors.white54, fontSize: 18),
                    ),
                  ),
                  TextFormField(
                    onChanged: (text) => {
                      newAmt = double.parse(text),
                      // print(newAmt.runtimeType),
                      updateBillTotal(newAmt, (calc.tipPercentage).toDouble(),
                          calc.splitAmt)
                    },
                    style: TextStyle(color: Colors.white54, fontSize: 25),
                    initialValue: "0.00",
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white54,
                      )),
                      labelStyle: TextStyle(color: Colors.white54),
                      icon: Icon(
                        Icons.attach_money_rounded,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  Totals(currentCalculation: calc),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffDBBFB8),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            'Tip',
                            style:
                                TextStyle(color: Colors.white54, fontSize: 25),
                          ),
                        ),
                        TextFormField(
                          onChanged: (text) => {
                            tipAmt = double.parse(text),
                            updateBillTotal(calc.amount.toDouble(),
                                tipAmt.toDouble(), calc.splitAmt)
                          },
                          style: TextStyle(color: Colors.white54, fontSize: 25),
                          initialValue: "15",
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white54,
                            )),
                            labelStyle: TextStyle(color: Colors.white54),
                            icon: Icon(
                              Icons.attach_money_rounded,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff528BA1),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            'Split',
                            style:
                                TextStyle(color: Colors.white54, fontSize: 25),
                          ),
                        ),
                        TextFormField(
                          onChanged: (text) => {print(text)},
                          style: TextStyle(color: Colors.white54, fontSize: 25),
                          initialValue: "0",
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white54,
                            )),
                            labelStyle: TextStyle(color: Colors.white54),
                            icon: Icon(
                              Icons.attach_money_rounded,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
