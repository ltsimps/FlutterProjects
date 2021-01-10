import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final String name;
  AddTask({Key key, @required this.name}) : super(key: key);

  Future<void> addTask() {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

    return tasks
        .add({"name": name})
        .then((value) => print("new task"))
        .catchError((onError) => print("Error"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
