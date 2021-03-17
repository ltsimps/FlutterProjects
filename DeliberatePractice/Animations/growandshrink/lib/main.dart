import 'package:flutter/material.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _size = 100;
  Color _boxColor = Colors.green;
  double _boxOpacity = 1.0;
  bool _showBox = false;

  void _changeShape() {
    setState(() {
      //_size = _size == 100 ? 200 : 100;
      //_boxColor = _boxColor == Colors.green ? Colors.purple : Colors.green;
      //_boxOpacity = _boxOpacity == 1.0 ? 0.0 : 1.0;
      _showBox = !_showBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: _showBox ? 1.0 : 0.5,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: _showBox ? 200 : 100,
            height: _showBox ? 200 : 100,
            color: _showBox ? Colors.purple : Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShape,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
