import 'package:flutter/material.dart';

void main() => runApp(AndroidFlutterExample());

class AndroidFlutterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String textToDisplay = "";

  void displayText() {
    setState(() {
      textToDisplay = "Hello!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$textToDisplay',
              key: Key("helloText"),
            ),
            MaterialButton(
              onPressed: displayText,
              key: Key("buttonHello"),
              child: new Text("Click Me!"),
            ),
          ],
        ),
      ),
    );
  }
}
