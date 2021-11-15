import 'package:team_app/models/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/svg.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size;
    return Scaffold(
      body : Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color : Colors.green[200] ,
              image: DecorationImage(
                image: AssetImage("assets/Diary_top.JPG"),
              )
            ),
          ),
           SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                        ),
                        child: Column(
                          children: <Widget>[SvgPicture.asset("assets/diet.svg")],
                        ),
                      ),
                    ]
                   ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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
  String? _workout;
  int? _kCalBurnt;
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

          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(29.5),
            ),
            child: TextFormField(
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

          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter kCal. Burns',
              icon: Icon(Icons.calculate),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter kCal. Burns';
              }
              if (int.parse(value) < 0){
                return 'Plase enter kCal. Burns';
              }
              return null;
            },
            onSaved: (value) {
              _kCalBurnt = int.parse(value!);
            },
            initialValue: context.read<FirstFormModel>().kCalBurnt.toString(),
          ),


          ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FirstFormModel>().date = _date;
                context.read<FirstFormModel>().time = _time;
                context.read<FirstFormModel>().menu= _menu;
                context.read<FirstFormModel>().kCal = _kCal;
                context.read<FirstFormModel>().kCalBurnt = _kCalBurnt;
                context.read<FirstFormModel>().workout = _workout;

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