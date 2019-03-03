import 'dart:async';

import 'package:android_flutter_example/screen/tab2_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../fake_application_injector.dart';
import '../mock_definition.dart';
import 'screen_test_util.dart';

const FILENAME = "hello.txt";

void main() {
  setupTest();

  testWidgets('tab2 shows a button Save that creates a file with some text',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Tab2Tab()));
    var tab2View = Tab2View(tester);

    await tab2View.clickOnSaveButton();

    verify(Mocks.exampleService.saveText());
  });

  testWidgets('tab2 shows a button Read that reads a file and displays it',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Tab2Tab()));
    var tab2View = Tab2View(tester);

      when(Mocks.exampleService.getSavedText()).thenAnswer((_) => Future.value("New file Content"));

      await tab2View.clickOnReadButton();

      expect(tab2View.getText(), "New file Content");
  });
}

class Tab2View {
  Tab2View(this.tester);

  final WidgetTester tester;

  Future<void> clickOnSaveButton() async {
    await tester.tap(find.byKey(Key("buttonSave")));
    await tester.pump();
  }

  Future<void> clickOnReadButton() async {
    await tester.tap(find.byKey(Key("buttonRead")));
    await tester.pump(Duration(milliseconds: 2000));
  }

  String getText() {
    var findSavedText = find.byKey(Key("savedText"));
    expect(findSavedText, findsOneWidget);

    Text savedText = tester.widget(findSavedText);
    return savedText.data;
  }
}
