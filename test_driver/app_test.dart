import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('test main screen:', () {
    FlutterDriver driver;
    int screenshotCounter = 1;
    String date;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      date = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
      new Directory('screenshots/$date').create();
    });

    tearDownAll(() {
      if (driver != null) {
        driver.close();
      }
    });

    var drawerMenuIcon = find.byValueKey('menuDrawerIcon');
    var themeSwitcher = find.byValueKey('themeSwitcher');
    var statusDrawerWidget = find.byValueKey('statusDrawerWidget');

    Future<void> takeScreenshot(String name) async {
      final String counter = screenshotCounter.toString().padLeft(3, '0');
      final String path = 'screenshots/$date/$counter. $name.png';
      final List<int> pixels = await driver.screenshot();
      final File file = new File(path);
      await file.writeAsBytes(pixels);
      print(path);
      screenshotCounter++;
    }

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('open drawer', () async {
      await driver.tap(drawerMenuIcon);
      await takeScreenshot('drawer_opened');
    });

    test('switch to dark mode', () async {
      await driver.tap(themeSwitcher);
      await takeScreenshot('dark_mode');
    });

    test('switch back to light mode', () async {
      await driver.tap(themeSwitcher);
      print(themeSwitcher.serialize());
      await takeScreenshot('light_mode');
    });

    test('close drawer', () async {
      await driver.scroll(drawerMenuIcon, -300, 0, Duration(milliseconds: 500));
      await takeScreenshot('drawer_closed');
    });

    test('open store status drawer', () async {
      await driver.tap(statusDrawerWidget);
      await takeScreenshot('store_status_drawer_opened');
    });

    test('close store status drawer', () async {
      await driver.tap(statusDrawerWidget);
      await takeScreenshot('store_status_drawer_closed');
    });
  });
}
