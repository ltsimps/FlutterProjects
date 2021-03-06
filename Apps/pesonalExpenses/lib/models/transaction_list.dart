import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pesonalExpenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  TransactionList({this.userTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: userTransaction.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.purple,
                  width: 2,
                )),
                child: Text(
                  '\$${userTransaction[index].amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userTransaction[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    DateFormat.yMMMd().format(userTransaction[index].date),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ));
        },
      ),
    );
  }
}
