import 'package:flutter/material.dart';
import 'package:pesonalExpenses/models/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Personal Expenses App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Text('Chart'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                // margin: EdgeInsets.all(100),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: widget.titleController,
                      // onChanged: (value) {
                      //   widget.titleInput = value;
                      // },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: widget.amountController,
                      // onChanged: (value) {
                      //   widget.amountInput = value;
                      // },
                    ),
                    FlatButton(
                      onPressed: () {
                        print(widget.titleController.text);
                        print(widget.amountController.text);
                      },
                      child: Text('Add Transaction'),
                    ),
                  ],
                ),
              ),
            ),
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
