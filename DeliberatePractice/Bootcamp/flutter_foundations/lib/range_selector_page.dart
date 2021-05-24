import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: 'Minimum',
                intValueSetter: (value) => _min = value,
              ),
              SizedBox(
                height: 16,
              ),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
                intValueSetter: (value) => _max = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: validate the form
          //TODO: Navigate to the generator page
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField(
      {Key? key, required this.labelText, required this.intValueSetter})
      : super(key: key);

  final String labelText;
  final void Function(int value) intValueSetter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
