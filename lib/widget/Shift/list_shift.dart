import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/Shift/deleted_shift.dart';
import 'package:flutter_application_1/widget/shift/active_shift.dart';

class Viewdetails extends StatefulWidget {
  final RosterService service;

  const Viewdetails({super.key, required this.service});

  @override
  State<Viewdetails> createState() => _ViewdetailsState();
}

class _ViewdetailsState extends State<Viewdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Shift"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActiveShift(
                      activeShift: widget.service.getAllShift(),
                    ),
                  ),
                );
              },
              child: const Text("View Active Shift Details"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeletedShift(
                            removedShift: widget.service.getRemovedShift())));
              },
              child: const Text("View Deleted Shift Details"),
            ),
          ],
        ),
      ),
    );
  }
}
