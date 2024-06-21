
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/roster/active_roster.dart';
import 'package:flutter_application_1/widget/roster/deleted_roster.dart';

class ListRoster extends StatefulWidget {
  const ListRoster({super.key,  required this.service});
  final RosterService service;
  

  @override
  State<ListRoster> createState() => _listRosterState();
}

class _listRosterState extends State<ListRoster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text(
          "Roster",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: [
          const  SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.cyanAccent,
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding:const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle:const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActiveRoster(service: widget.service,getRoster: widget.service.getRoster(),),
                      ));
                },
                child:const Text("Active Roster")),
          const  SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.cyanAccent,
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding:const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle:const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DeletedRoster(removeRoster: widget.service.getAllRomovedRoster(),),
                      ));
                },
                child:const Text("Deleted Roster")),
          ],
        ),
      ),
    );
  }
}
