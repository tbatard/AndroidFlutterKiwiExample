import 'package:flutter_driver/flutter_driver.dart';

class HomeTab {
  final FlutterDriver driver;
  final buttonHelloFinder = find.byValueKey('buttonHello');
  final helloTextFinder = find.byValueKey('helloText');

  HomeTab(this.driver);

  Future<void> clickOnDisplayButton() async {
    await driver.tap(buttonHelloFinder);
  }

  Future<String> getText() async {
    return await driver.getText(helloTextFinder);
  }
}