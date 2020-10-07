## radio_button_form_field

A Flutter Package to create radio buttons as FormFields, each contained in a ListTile with the button as the Leading Widget.


## Usage

This widget should be used like any other FormField widget in a Form.
This widget must have a MaterialWidget ancestor, such as a MaterialApp or Form widget.
If it does not have a Form widget as an ancestor, it needs to be given a GlobalKey.
The widget requires a List<Map> of the data you want built into the RadioButtonFormField.
The key given to the value of each item should be passed to the value parameter, 
and the key given to the title should be passed to the display parameter.
The widget will return a ListView containing an equal number of items as the List it was passed.

## Example

<img src="https://user-images.githubusercontent.com/65566908/95244536-1cab7700-07e0-11eb-8d8c-169f811bed84.gif" height="500">

```dart
import 'package:flutter/material.dart';
import 'package:radio_button_form_field/radio_button_form_field.dart';

void main() {
  runApp(MyApp());
}

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
  String myValue = 'No value saved yet.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Form Field Example'),
      ),
      body: SafeArea(
        child: Form(
          key: myFormKey,
          child: ExpansionTile(
            children: [
              RadioButtonFormField(
                toggleable: true,
                padding: EdgeInsets.all(8),
                context: context,
                value: 'value',
                display: 'display',
                data: data,
                onSaved: (value) {
                  setState(() {
                    myNumber = value;
                    myValue = value.toString();
                  });
                },
              ),
              FlatButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Submit'),
              ),
              Text(myValue)
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final FormState formState = myFormKey.currentState;
    if (formState.validate()) {
      formState.save();
      print(myNumber);
    }
  }
}

final List<Map> data = [
  {'value': 1, 'display': 'One'},
  {'value': 2, 'display': 'Two'},
  {'value': 3, 'display': 'Three'}
];
```

## Contributing

Contributions are welcome as pull requests to the github repo.
Please open issues on the repo for feature requests or bug reports.
