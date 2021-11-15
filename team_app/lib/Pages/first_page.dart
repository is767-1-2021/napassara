import 'package:team_app/models/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fill extends StatefulWidget{
  @override
  _FillState createState() => _FillState();
}

class _FillState extends State<Fill> {
  String? _formData = 'Please click to fill the form';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary Note'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child){
                  return Text('${form.date} ${form.time} ${form.menu} ${form.kCal}' );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2');
              }, 
              child: Text('Fill this form please'),
              style: TextButton.styleFrom(
                  primary: Colors.lightBlue[50],
                  backgroundColor: Colors.teal,
                  onSurface: Colors.black12,
                ),
              ),              
          ],
        ),
      ),
    );
  }
}