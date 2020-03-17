import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:intl/intl.dart';

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

class CheckCurrentDate extends GivenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final elementFinder = find.byValueKey("dateItem0");
    DateTime date = DateTime.now();
    String dateAsString = DateFormat('dd MMM.').format(date).toLowerCase();
    expect(await FlutterDriverUtils.getText(world.driver, elementFinder), dateAsString);
  }

  @override
  RegExp get pattern => RegExp(r"I should see the date of the current day");
}

class PutTextOnField extends Given2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String text, String elementId) async {
    final elementFinder = find.byValueKey(elementId);
    await FlutterDriverUtils.enterText(world.driver, elementFinder, text);
  }

  @override
  RegExp get pattern => RegExp(r"I put the text {string} on the field {string}");
}

