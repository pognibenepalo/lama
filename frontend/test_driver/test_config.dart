import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';


Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [ClickOnElement(), CheckFieldAndText(), PutTextOnField()]
    ..restartAppBetweenScenarios = false
    ..targetAppPath = "test_driver/app-bdd.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}