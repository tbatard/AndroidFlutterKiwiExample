import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:android_flutter_example/main.dart';

void main() {
  testWidgets('home shows a button Display that displays "Hello!"',
      (WidgetTester tester) async {
    await tester.pumpWidget(AndroidFlutterExample());
    var homeView = HomeView(tester);

    expect(homeView.getText(), "");

    await homeView.clickOnDisplayButton();

    expect(homeView.getText(), "Hello!");
  });
}

class HomeView {
  HomeView(this.tester);

  final WidgetTester tester;

  void clickOnDisplayButton() async {
    await tester.tap(find.byKey(Key("buttonHello")));
    await tester.pump();
  }

  String getText() {
    var findHelloText = find.byKey(Key("helloText"));
    expect(findHelloText, findsOneWidget);

    Text helloText = tester.widget(findHelloText);
    return helloText.data;
  }
}
