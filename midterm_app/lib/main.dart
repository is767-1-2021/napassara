import 'package:flutter/material.dart';
import 'package:midterm_app/models/first_form_model.dart';
import 'package:provider/provider.dart';

import 'Pages/first_page.dart';
import 'Pages/second_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.blue,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.purple),
          ),
        ),
        initialRoute: '/0',
        routes: <String, WidgetBuilder>{
          '/0': (context) => MenuPage(),
          '/1': (context) => FirstPage(),
          '/2': (context) => SecondPage(),
          '/3': (context) => ThirdPage(),
          '/4': (context) => FourthPage(),
          '/5': (context) => FifthPage(),
          '/6': (context) => SixthPage(),
        });
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/${index + 1}');
            },
          child: Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: Theme.of(context).textTheme.headline5
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget{
  @override
  _ThirdPageState createState() => _ThirdPageState();
}
class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/0');
            },
            icon: Icon(Icons.arrow_back)
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.build_sharp),
        onPressed: () {},
      ),
    );
  }
}

class FourthPage extends StatefulWidget{
  @override
  _FourthPageState createState() => _FourthPageState();
}
class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Page'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/0');
            },
            icon: Icon(Icons.arrow_back)
          ),
        ],
      ),
    );
  }
}



class FifthPage extends StatefulWidget{
  @override
  _FifthPageState createState() => _FifthPageState();
}
class _FifthPageState extends State<FifthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fifth Page'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/0');
            },
            icon: Icon(Icons.arrow_back)
          ),
        ],
      ),
    );
  }
}
              
class SixthPage extends StatefulWidget{
  @override
  _SixthPageState createState() => _SixthPageState();
}
class _SixthPageState extends State<SixthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sixth Page'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/0');
            },
            icon: Icon(Icons.arrow_back)
          ),
        ],
      ),
    );
  }
}

