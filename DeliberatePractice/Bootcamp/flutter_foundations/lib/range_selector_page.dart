import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';
import 'package:flutter_foundations/ranomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RangeSelectorPage extends StatefulWidget {
  RangeSelectorPage({
    Key? key,
  }) : super(key: key);

  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
        centerTitle: true,
      ),
      body: RangeSelectorForm(
        formKey: formKey,
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
                min: context.read<RandomizerChangeNotifier>().min,
                max: context.read<RandomizerChangeNotifier>().max,
              ),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
