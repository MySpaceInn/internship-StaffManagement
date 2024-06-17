import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/leave/create_leave_Page.dart';
import 'package:flutter_application_1/widget/leave/remove_leavepage.dart';
import 'package:flutter_application_1/widget/leave/restore_leavepage.dart';
import 'package:flutter_application_1/widget/leave/update_leave.dart';

import 'package:flutter_application_1/widget/leave/view_detailspage.dart';



class LeaveMenu extends StatefulWidget {
  final AllowanceService allowanceService;

  LeaveMenu({Key? key, required this.allowanceService}) : super(key: key);

  @override
  _LeaveMenuState createState() => _LeaveMenuState();
}

class _LeaveMenuState extends State<LeaveMenu> {
  @override
  void initState() {
    super.initState();
  }

  void addleave(Leave leave) {
    setState(() {
      widget.allowanceService.repo.addLeave(leave);
    });
  }

  void removeleave(int tax) {
    setState(() {
      Leave? leave = widget.allowanceService.repo.leaveList.firstWhere(
        (leave) => leave.id == leave.id,
      );
      if (leave != null) {
        widget.allowanceService.repo.leaveList.remove(leave);
        widget.allowanceService.repo.removedLeaveList.add(leave);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("leave Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateLeave(
                      allowanceService: widget.allowanceService,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Create leave",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateLeavePage(allowanceService: widget.allowanceService)
                      
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Update leave",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DeleteLeave(allowanceService: widget.allowanceService),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Remove Account",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RestoreLeave(allowanceService: widget.allowanceService),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Restore leave",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ), SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewLeaveDetails(
                     allowanceService: widget.allowanceService,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "View leave Details",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ), SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
