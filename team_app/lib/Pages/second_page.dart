import 'package:team_app/models/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Date&Time and Menu'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _date;
  String? _time; 
  String? _menu;
  
  int? _kCal;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter date',
              icon: Icon(Icons.event_note),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter date';
              }
              return null;
            },
            onSaved: (value) {
              _date = value;
            },
            initialValue: context.read<FirstFormModel>().date,
          ),

          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter time',
              icon: Icon(Icons.watch_later),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter time';
              }
              return null;
            },
            onSaved: (value) {
              _time = value;
            },
            initialValue: context.read<FirstFormModel>().time,
          ),

          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your menu',
              icon: Icon(Icons.local_restaurant),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter menu';
              }
              return null;
            },
            onSaved: (value) {
              _menu = value;
            },
            initialValue: context.read<FirstFormModel>().menu,
          ),

          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter kCal.',
              icon: Icon(Icons.calculate),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter kCal.';
              }
              if (int.parse(value) < 0){
                return 'Plase enter kCal.';
              }
              return null;
            },
            onSaved: (value) {
              _kCal = int.parse(value!);
            },
            initialValue: context.read<FirstFormModel>().kCal.toString(),
          ),

          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FirstFormModel>().date = _date;
                context.read<FirstFormModel>().time = _time;
                context.read<FirstFormModel>().menu= _menu;
                context.read<FirstFormModel>().kCal = _kCal;

                Navigator.pop(context);            
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}