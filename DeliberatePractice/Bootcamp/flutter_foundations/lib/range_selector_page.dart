import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  RangeSelectorPage({
    Key? key,
  }) : super(key: key);

  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
        centerTitle: true,
      ),
      body: RangeSelectorForm(
        maxValueSetter: (value) => _max = value,
        minValueSetter: (value) => _min = value,
        key: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
          }
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => RandomizerPage(
          //       min: _min,
          //       max: _max,
          //     ),
          //   ),
          // );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RandomizerPage(
                min: _min,
                max: _max,
              ),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
