import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/widget/staff/active_details.dart';
import 'package:flutter_application_1/widget/staff/delete_details.dart';

class Viewdetails extends StatefulWidget {
  final BusinessService businessService;

  Viewdetails({
    super.key,
    required this.businessService,
  });

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
                      activeStaff: widget.businessService.getStaffs(),
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
                              deleteStaff:
                                  widget.businessService.getRemovedStaffs(),
                            )));
              },
              child: Text("View Deleted Staff Details"),
            ),
          ],
        ),
      ),
    );
  }
}
