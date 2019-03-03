import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'tabs/HomeTab.dart';
import 'tabs/Tab2Tab.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('Home Tab', () {
    HomeTab homeTab;

    setUp(() {
      homeTab = HomeTab(driver);
    });

    test('home shows a button Display that displays "Hello Home!"', () async {
      await homeTab.clickOnDisplayButton();

      expect(await homeTab.getText(), "Hello Home!");
    });
  });

  group('Tab2 Tab', () {
    Tab2Tab tab2Tab;

    setUp(() {
      tab2Tab = Tab2Tab(driver);
    });

    test('tab2 shows a button to read/display and save text', () async {
      await tab2Tab.clickOnTab2Tab();

      await tab2Tab.clickOnReadButton();

      expect(await tab2Tab.getText(), "null");

      await tab2Tab.clickOnSaveButton();
      await tab2Tab.clickOnReadButton();

      expect(await tab2Tab.getText(), "Hello Storage");
    });
  });
}
