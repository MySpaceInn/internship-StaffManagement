import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';
import 'package:flutter_application_1/widget/shift/active_shift.dart';
import 'package:flutter_application_1/widget/shift/deleted_shift.dart';

class Viewdetails extends StatefulWidget {
  final List<Shift> shifts;
  final List<Shift> removeshifts;

  const Viewdetails(
      {super.key, required this.shifts, required this.removeshifts});

  @override
  State<Viewdetails> createState() => _ViewdetailsState();
}

class _ViewdetailsState extends State<Viewdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Shift"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActiveShift(
                      shifts: widget.shifts,
                    ),
                  ),
                );
              },
              child: Text("View Active Shift Details"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Deletedshift(
                            shifts: widget.removeshifts)));
              },
              child: Text("View Deleted Shift Details"),
            ),
          ],
        ),
      ),
    );
  }
}
