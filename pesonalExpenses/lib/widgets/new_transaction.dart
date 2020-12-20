import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction({Key key, this.addTransaction}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text;
    final entertedAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || entertedAmount <= 0) {
      return;
    }

    addTransaction(enteredTitle, entertedAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
                addTransaction(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
