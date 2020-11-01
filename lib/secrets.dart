import 'dart:io';

class Secret {
  static const ANDROID_CLIENT_ID =
      "532346524547-vme6r9qh2pg3cebkhikacgpid1h5lhor.apps.googleusercontent.com";
  static const IOS_CLIENT_ID =
      "532346524547-7gdbh16gt050j53adqm07tcrgoshss69.apps.googleusercontent.com";
  static String getId() =>
      Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}
