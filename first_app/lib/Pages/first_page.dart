import 'package:first_app/Pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _formData = 'Please Click to fill the form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.agriculture)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              icon: Icon(Icons.bus_alert)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('$_formData'),
            ),
            ElevatedButton(
              //*async & await use for make sure that we will get the response value to display
              onPressed: () async {
                var response = await Navigator.pushNamed(context, '/6');

                if (response != null && !response.toString().isEmpty) {
                  setState(() {
                    _formData = response.toString();
                  });
                }
              },
              child: Text('Fill This Form please'),
            ),
          ],
        ),
      ),
    );
  }
}