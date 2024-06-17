

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/model/shift.dart';
import 'package:flutter_application_1/widget/Shift/create_shift.dart';
import 'package:flutter_application_1/widget/Shift/delete_shift.dart';
import 'package:flutter_application_1/widget/Shift/list_shift.dart';
import 'package:flutter_application_1/widget/Shift/restore_shift.dart';
import 'package:flutter_application_1/widget/Shift/update_shift.dart';

class ShiftMenu extends StatefulWidget {
  final Roster roster;

  ShiftMenu({Key? key, required this.roster}) : super(key: key);

  @override
  _ShiftMenuState createState() => _ShiftMenuState();
}

class _ShiftMenuState extends State<ShiftMenu> {
  @override
  void initState() {
    super.initState();
  }

  void addShift(Shift shift) {
    setState(() {
      widget.roster.addShift(shift);
    });
  }

  void removeStaff(int id) {
    setState(() {
      Shift? shift = widget.roster.shifts.firstWhere(
        (shift) => shift.id == id,
      );
      if (shift != null) {
        widget.roster.shifts.remove(shift);
        widget.roster.removeshifts.add(shift);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Shift Management"),
      ),
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
                    builder: (context) => CreateShift(
                      roster: widget.roster,
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
                  "Create Shift",
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
                        UpdateShift(roster: widget.roster),
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
                  "Update Shift",
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
                        DeleteShift(roster: widget.roster),
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
                  "Remove Shift",
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
                        RestoreShift(roster: widget.roster),
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
                  "Restore Shift",
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
                    builder: (context) => Viewdetails(
                      shifts: widget.roster.shifts,
                      removeshifts: widget.roster.removeshifts,
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
                  "View Shift Details",
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
