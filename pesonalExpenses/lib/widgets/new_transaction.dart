import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction({Key key, this.addTransaction}) : super(key: key);

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
              // onChanged: (value) {
              //   widget.titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) {
              //   widget.amountInput = value;
              // },
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
