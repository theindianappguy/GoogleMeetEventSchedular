import 'dart:io';

class Secret {
  static const ANDROID_CLIENT_ID = "";
  static const IOS_CLIENT_ID = "";
  static String getId() =>
      Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}
