import 'package:flutter/material.dart';
import 'package:google_meet_app/models/event_info.dart';
import 'package:google_meet_app/resources/color.dart';
import 'package:google_meet_app/screens/create_screen.dart';
import 'package:google_meet_app/utils/storage.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          "Event Details",
          style: TextStyle(
            color: CustomColor.dark_blue,
            fontSize: 22,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.dark_cyan,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateScreen(),
          ));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 8.0),
          color: Colors.white,
          child: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.documents.length > 0) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> eventInfo =
                          snapshot.data.documents[index].data();

                      EventInfo event = EventInfo.fromMap(eventInfo);
                    },
                  );
                }
              }

              return Center(
                  child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(CustomColor.sea_blue),
              ));
            },
          ),
        ),
      ),
    );
  }
}
