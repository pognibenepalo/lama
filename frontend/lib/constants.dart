import 'dart:io' show Platform;

class Constants {
  static final String apiServer = Platform.isAndroid
      ? 'http://10.0.2.2:7070/api/v1'
      : 'http://localhost:7070/api/v1';
}
