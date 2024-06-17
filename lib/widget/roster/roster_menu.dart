import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/roster/create_roster.dart';
import 'package:flutter_application_1/widget/roster/delete_roster.dart';
import 'package:flutter_application_1/widget/roster/list_roster.dart';
import 'package:flutter_application_1/widget/roster/restore_roster.dart';
import 'package:flutter_application_1/widget/roster/update_roster.dart';



class RosterMenu extends StatefulWidget {
  const RosterMenu({Key ?key,required this.service, }) :super(key: key);
final RosterService service;

  @override
  State<RosterMenu> createState() => _RosterMenuState();
}

class _RosterMenuState extends State<RosterMenu> {
List<Roster> rosters =[];
List<Roster> removeRosters =[];


  @override
  void initState(){
    super.initState();
    rosters =widget.service.rosters;
    removeRosters=widget.service.removeRosters;
  }

  void addRoster(Roster roster) {
    setState(() {
      rosters.add(roster);
      widget.service.rosters = rosters;
    });
  }

  void removeBusiness(int id) {
    setState(() {
      Roster? roster = rosters.firstWhere(
        (roster) => roster.id == id,
      );
      if (Roster != null) {
        rosters.remove(roster);
        removeRosters.add(roster);
      }
    });
  }

  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateRoster(
                      service: widget.service,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Create Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateRoster(
                      rosters: widget.service.rosters,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Update Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteRoster(
                      service: widget.service,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Remove Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RestoreRoster(service: widget.service),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Restore Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ListRoster(Service: widget.service),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "View Rosters",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
