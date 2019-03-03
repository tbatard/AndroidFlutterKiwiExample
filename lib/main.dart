import 'package:flutter/material.dart';

import 'package:android_flutter_example/application_injector.dart';
import 'package:android_flutter_example/screen/home_tab.dart';
import 'package:android_flutter_example/screen/tab2_tab.dart';

void main() => runApp(AndroidFlutterExample());

class AndroidFlutterExample extends StatelessWidget {
  AndroidFlutterExample() {
    setup();
  }

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
  int selectedTab = 0;
  final tabs = [
    HomeTab(),
    Tab2Tab(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: tabs.elementAt(selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home', key: Key("bottomNavigationHome"),)),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Tab2', key: Key("bottomNavigationTab2"),)),
        ],
        currentIndex: selectedTab,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }
}
