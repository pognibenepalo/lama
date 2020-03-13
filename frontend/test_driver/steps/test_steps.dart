import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ClickOnElement extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String id) async {
    final elementFinder = find.byValueKey(id);
    await FlutterDriverUtils.tap(world.driver, elementFinder);
  }

  @override
  RegExp get pattern => RegExp(r"I click on {string}");
}

class CheckFieldAndText extends Given2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String elementId, String expectedText) async {
    final elementFinder = find.byValueKey(elementId);
    expect(
      await FlutterDriverUtils.getText(world.driver, elementFinder), expectedText,
    );
  }

  @override
  RegExp get pattern => RegExp(r"I should have a field {string} with the value {string}");
}
