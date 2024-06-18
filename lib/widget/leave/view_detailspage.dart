import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/leave/active_leave_page.dart';
import 'package:flutter_application_1/widget/leave/deleted_leavepage.dart';

class ViewLeaveDetails extends StatefulWidget {
  final AllowanceService allowanceService;

  ViewLeaveDetails({super.key, required this.allowanceService});

  @override
  State<ViewLeaveDetails> createState() => _ViewLeavedetailsState();
}

class _ViewLeavedetailsState extends State<ViewLeaveDetails> {
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
                    builder: (context) => ActiveLeaveDetails(
                    activeLeave: widget.allowanceService.getActiveLeave(),
                    ),
                  ),
                );
              },
              child: Text("View Active Leave Details"),
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
                        builder: (context) => DeletedLeaveDetails(
                           removedLeave:  widget.allowanceService.getRemovedLeave(),
                            )));
              },
              child: Text("View Deleted Leave Details"),
            ),
          ],
        ),
      ),
    );
  }
}
