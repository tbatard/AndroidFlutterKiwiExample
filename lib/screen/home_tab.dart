import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'package:android_flutter_example/service/example_service_impl.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> {
  ExampleService exampleService;
  String textToDisplay = "";

  HomeTabState() {
    var container = kiwi.Container();
    exampleService = container.resolve("exampleService");
  }

  void displayText() {
    setState(() {
      textToDisplay = exampleService.getHello();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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