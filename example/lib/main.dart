import 'package:flutter/material.dart';
import 'package:radio_button_form_field/radio_button_form_field.dart';

//TODO: finish this
void main() {
  runApp(MyApp());
}

enum SingingCharacter { lafayette, jefferson }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: ExampleForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExampleForm extends StatefulWidget {
  @override
  _ExampleFormState createState() => _ExampleFormState();
}

GlobalKey myFormKey = new GlobalKey();

class _ExampleFormState extends State<ExampleForm> {
  int myNumber;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Form Field Example'),
      ),
      body: SafeArea(
        child: Form(
          key: myFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioButtonFormField(
                context: context,
                value: 'value',
                display: 'display',
                data: data,
                onSaved: (value) {
                  setState(() {
                    myNumber = value;
                  });
                },
              ),
              FlatButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final FormState formState = myFormKey.currentState;
    formState.save();
    print(myNumber);
  }
}

final List<Map> data = [
  {'value': 1, 'display': 'One'},
  {'value': 2, 'display': 'Two'},
  {'value': 3, 'display': 'Three'}
];
