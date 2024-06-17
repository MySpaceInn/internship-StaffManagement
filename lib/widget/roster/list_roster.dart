
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/widget/roster/active_roster.dart';
import 'package:flutter_application_1/widget/roster/deleted_roster.dart';

// ignore: must_be_immutable
class ListRoster extends StatefulWidget {
  ListRoster({super.key, required this.Service});
  final Service;
  List<Roster> roster = [];

  @override
  State<ListRoster> createState() => _listShiftState();
}

class _listShiftState extends State<ListRoster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Roster",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.cyanAccent,
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActiveRoster(service: widget.Service),
                      ));
                },
                child: Text("Active Roster")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.cyanAccent,
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DeletedRoster(rosters: widget.Service.removeRosters),
                      ));
                },
                child: Text("Deleted Roster")),
          ],
        ),
      ),
    );
  }
}
