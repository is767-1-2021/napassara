import 'package:flutter/material.dart';

class DiaryPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: ,
              image: DecorationImage(image: null)
            ),
          )
        ],
      ),
    );
  }
}