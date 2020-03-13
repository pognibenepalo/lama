import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('LAMA App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('First dateItem should be 12 Mar 2020', () async {
      final dateItem0 = find.byValueKey('dateItem0');
      expect(await driver.getText(dateItem0), "14 Mar 2020");
    });

    test('First word should be Cat', () async {
      final wordItem0 = find.byValueKey('word0');
      expect(await driver.getText(wordItem0), "Cat");
    });

    test('User tap on wordItem then wordItem should be expanded', () async {
      final wordItemGesture0 = find.byValueKey('wordItemGesture0');
      await driver.tap(wordItemGesture0);

      final wordDesc0 = find.byValueKey('wordDesc0');
      expect(
        await driver.getText(wordDesc0),
        "a small animal with fur, four legs, a tail, and claws, usually kept as a pet or for catching mice",
      );

      final wordQuote0 = find.byValueKey('wordQuote0');
      expect(
        await driver.getText(wordQuote0),
        "My cat likes dozing in front of the fire.",
      );
    });

    test('User tap on add word button user should see popup for add word.',
        () async {
      final addWordButton = find.byValueKey('addTextButton');
      await driver.tap(addWordButton);

      final addNewWordDialogTitle = find.byValueKey('addNewWordDialogTitle');
      expect(await driver.getText(addNewWordDialogTitle), 'New word');
    });

    test(
        'User fill the value and click save then user should return to list page and see the new word',
        () async {
      final newWordInput = find.byValueKey('newWordInput');
      await driver.tap(newWordInput); // acquire focus
      await driver.enterText('Hello');

      final newDefinitionInput = find.byValueKey('newDefinitionInput');
      await driver.tap(newDefinitionInput); // acquire focus
      await driver.enterText('Hello is the greeting word');

      final newQuoteInput = find.byValueKey('newQuoteInput');
      await driver.tap(newQuoteInput); // acquire focus
      await driver.enterText('Hello World !!!');

      final saveButton = find.byValueKey('saveButton');
      await driver.tap(saveButton);
    });
  });
}
