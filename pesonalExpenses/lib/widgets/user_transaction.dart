import 'package:flutter/material.dart';
import 'package:pesonalExpenses/models/transaction.dart';
import 'package:pesonalExpenses/models/transaction_list.dart';
import 'package:pesonalExpenses/widgets/new_transaction.dart';

class UserTransActions extends StatefulWidget {
  @override
  _UserTransActionsState createState() => _UserTransActionsState();
}

class _UserTransActionsState extends State<UserTransActions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: ' Weekly Groceries ',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: 't' + DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction: _addNewTransaction),
        TransactionList(
          userTransaction: _userTransaction,
        ),
      ],
    );
  }
}
