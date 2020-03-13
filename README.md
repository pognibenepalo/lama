Purpose
====


This project is an example of a simple Flutter application, connected to a lambda function and with set of E2E tests. You can use it to play with the tets for the first time and be familiar with a simple REST connexion.


How to run the backend
--

To run the backend locally you need to run the following command:

    mvn -Dtest=Runner test


How to run the frontend
--

To run the frontend you need to launch the *main.dart*


How to run the E2E tests
--

To run the classic flutter tests from the command line:

    flutter drive --target=test_driver/app.dart

If you want to run behaviour tests writes in Gherkin from comand line:

    dart test_driver/test_config.dart
