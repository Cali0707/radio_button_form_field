import 'package:flutter/material.dart';
import 'package:radio_button_form_field/radio_button_form_field.dart';

void main() {
  runApp(MyApp());
}

enum SingingCharacter {lafayette, jefferson}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: ExampleForm(),
    );
  }
}

class ExampleForm extends StatefulWidget {
  @override
  _ExampleFormState createState() => _ExampleFormState();
}

GlobalKey myFormKey = new GlobalKey();

class _ExampleFormState extends State<ExampleForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Form Field Example'),
      ),
      body: SafeArea(
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              RadioButtonFormField(
                  value: SingingCharacter.jefferson,
                  title: Text('Jefferson'))
            ],
          ),
        ),
      ),
    );
  }
}
