import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_meet_app/screens/dashboard_screen.dart';
import 'package:google_meet_app/secrets.dart';
import 'package:google_meet_app/utils/calendar_client.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var _clientId = new ClientId(Secret.getId(), "");
  const _scopes = const [cal.CalendarApi.CalendarScope];
  await clientViaUserConsent(_clientId, _scopes, prompt)
      .then((AuthClient client) async {
    CalendarClient.calendar = cal.CalendarApi(client);
  });

  runApp(MyApp());
}

void prompt(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Event Scheduling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}
