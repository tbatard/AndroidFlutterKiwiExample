import 'package:flutter_driver/flutter_driver.dart';

class Tab2Tab {
  final FlutterDriver driver;
  final bottomNavigationTab2Finder = find.byValueKey('bottomNavigationTab2');
  final buttonReadFinder = find.byValueKey('buttonRead');
  final buttonSaveFinder = find.byValueKey('buttonSave');
  final savedTextFinder = find.byValueKey('savedText');

  Tab2Tab(this.driver);

  Future<void> clickOnTab2Tab() async {
    await driver.tap(bottomNavigationTab2Finder);
  }

  Future<void> clickOnReadButton() async {
    await driver.tap(buttonReadFinder);
  }

  Future<void> clickOnSaveButton() async {
    await driver.tap(buttonSaveFinder);
  }

  Future<String> getText() async {
    return await driver.getText(savedTextFinder);
  }
}