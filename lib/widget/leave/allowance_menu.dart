import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/leave/create_leave_Page.dart';
import 'package:flutter_application_1/widget/leave/remove_leavepage.dart';
import 'package:flutter_application_1/widget/leave/restore_leavepage.dart';
import 'package:flutter_application_1/widget/leave/update_leave.dart';
import 'package:flutter_application_1/widget/leave/view_detailspage.dart';


class AllowanceMenu extends StatefulWidget {
  const AllowanceMenu({super.key, required this.service});
  final AllowanceService service;

  @override
  State<AllowanceMenu> createState() => _StaffMenuState();
}

class _StaffMenuState extends State<AllowanceMenu> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.white,

    //   child: const Text("Leave Management"),

    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Leave management",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 65,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 99, 248, 156),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CreateLeavePage(service: widget.service),
                      ),
                    );
                  },
                  child: Text("1.create leave")),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 65,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 99, 248, 156),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateLeavePage(
                                  service: widget.service,
                                )));

                    widget.service.updateLeave();
                  },
                  child: Text("2.update leave")),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 65,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 99, 248, 156),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestoreLeavePage(
                                  service: widget.service,
                                )));

                    widget.service.restoreLeave();
                  },
                  child: Text("3.restore leave")),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 65,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 99, 248, 156),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RemoveLeavePage(service: widget.service)));

                    widget.service.removeLeave();
                  },
                  child: Text("4.remove leave")),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 65,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 99, 248, 156),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewDetailsPage(
                            leaves: widget.service.leaves,
                            Deletedleaves: widget.service.deletedLeaves,
                          ),
                        ));
                    widget.service.displayLeaveDetails();
                  },
                  child: Text("5.view details of leave")),
            )
          ],
        ),
      ),
    );
  }
}