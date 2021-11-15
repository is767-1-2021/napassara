import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DiaryPage extends StatelessWidget{
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
          )
        ]
        ),
      appBar: AppBar(
        title: Text('Enter Date & Time and Menu'),
      ),
    );
  }
}

