import 'package:flutter/material.dart';
import 'package:flutter_foundations/range_selector_page.dart';
import 'package:flutter_foundations/ranomizer_change_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        title: 'Randomizer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RangeSelectorPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
