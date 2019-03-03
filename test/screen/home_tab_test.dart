import 'package:android_flutter_example/screen/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../fake_application_injector.dart';
import '../mock_definition.dart';
import 'screen_test_util.dart';

void main() {
  setupTest();

  testWidgets('home shows a button Display that displays "Hello!"',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomeTab()));
    var homeView = HomeView(tester);
    var expectedText = "Some Text To Display";

    when(Mocks.exampleService.getHello()).thenReturn(expectedText);

    await homeView.clickOnDisplayButton();

    expect(homeView.getText(), expectedText);
  });
}

class HomeView {
  HomeView(this.tester);

  final WidgetTester tester;

  Future<void> clickOnDisplayButton() async {
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
