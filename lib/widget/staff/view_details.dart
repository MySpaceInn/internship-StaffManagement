import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/widget/staff/active_details.dart';
import 'package:flutter_application_1/widget/staff/delete_details.dart';

class Viewdetails extends StatefulWidget {
  final List<Staff> staffList;
  final List<Staff> removedStaffList;

  Viewdetails(
      {super.key, required this.staffList, required this.removedStaffList});

  @override
  State<Viewdetails> createState() => _ViewdetailsState();
}

class _ViewdetailsState extends State<Viewdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Details"),
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
                    builder: (context) => ActiveStaffDetails(
                      staffList: widget.staffList,
                    ),
                  ),
                );
              },
              child: Text("View Active Staff Details"),
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
                        builder: (context) => DeleteStaffDetails(
                            staffList: widget.removedStaffList)));
              },
              child: Text("View Deleted Staff Details"),
            ),
          ],
        ),
      ),
    );
  }
}
