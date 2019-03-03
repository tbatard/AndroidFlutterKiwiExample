import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'package:android_flutter_example/service/example_service_impl.dart';

class Tab2Tab extends StatefulWidget {
  Tab2Tab({Key key}) : super(key: key);

  @override
  Tab2TabState createState() => Tab2TabState();
}

class Tab2TabState extends State<Tab2Tab> {
  ExampleService exampleService;
  String textToDisplay = "";

  Tab2TabState() {
    var container = kiwi.Container();
    exampleService = container.resolve("exampleService");
  }
  void displayText() {
    setState(() {
      textToDisplay = "Hello!";
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
              key: Key("savedText"),
            ),
            MaterialButton(
              onPressed: readText,
              key: Key("buttonRead"),
              child: new Text("Read Text"),
            ),
            MaterialButton(
              onPressed: saveText,
              key: Key("buttonSave"),
              child: new Text("Save Text"),
            ),
          ],
        ),
      ),
    );
  }

  void readText() async {
    var text = await exampleService.getSavedText();

    setState(() {
      textToDisplay = text;
    });
  }

  void saveText() {
    exampleService.saveText();
  }

}