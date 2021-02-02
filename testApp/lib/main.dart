import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testApp/widgets/addTaskWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Worked put seems like a hack when we have future builder
  await Firebase.initializeApp();

  runApp(ProviderScope(child: MyApp()));
}

final taskProvider = StreamProvider((ref) {
  return FirebaseFirestore.instance.collection('tasks').snapshots();
});

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget("exception");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter ',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyHomePage(title: 'Finishi'),
            );
          }

          return CircularProgressIndicator();
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final currentTask = AddTask(name: "Hello World");

  final listOfTask = FirebaseFirestore.instance.collection('tasks');

  Widget getError() {
    return Text("Errro");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            var list = watch(taskProvider);
            return ListView.builder(
              itemCount: list.data.value.docs.length,
              itemBuilder: (ctxt, int index) {
                return ChartLine(
                  rate: Random().nextDouble(),
                  title: list.data.value.docs[index]
                      ['name'], //list.data.value.toString(),
                );
              },

              // children: [
              //   list.map(
              //     data: (_) => ChartLine(
              //         rate: Random().nextDouble(),
              //         title: _.data.value.docs.first.toString().),
              //     loading: (_) => CircularProgressIndicator(),
              //     error: (_) => Text(_.error.toString()),
              //   ),
              // ],
            );
          },
        ),
      ),

      // body: StreamBuilder<QuerySnapshot>(
      //   stream: listOfTask.snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       return Text("Something went Wrong");
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator();
      //     }
      //     //Success
      //     return ListView(
      //       children: snapshot.data.docs.map((document) {
      //         return ChartLine(
      //             rate: Random().nextDouble(), title: document.data()['name']);
      //       }).toList(),
      //     );
      //   },
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: createTask(),
        tooltip: 'Firebase',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  createTask() {
    currentTask.addTask();
  }
}

class ChartLine extends StatelessWidget {
  const ChartLine({
    Key key,
    @required this.rate,
    @required this.title,
    this.number,
  })  : assert(title != null),
        assert(rate != null),
        assert(rate > 0),
        assert(rate <= 1),
        super(key: key);

  final double rate;
  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final lineWidget = constraints.maxWidth * rate;

      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(minWidth: lineWidget),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    if (number != null)
                      Text(
                        number.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 60,
              width: lineWidget,
            ),
          ],
        ),
      );
    });
  }
}
