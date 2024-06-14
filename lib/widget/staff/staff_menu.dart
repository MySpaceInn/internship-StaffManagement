import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/widget/staff/create_account.dart';
import 'package:flutter_application_1/widget/staff/remove_account.dart';
import 'package:flutter_application_1/widget/staff/restore_account.dart';
import 'package:flutter_application_1/widget/staff/update_account.dart';
import 'package:flutter_application_1/widget/staff/view_details.dart';

class StaffMenu extends StatefulWidget {
  final BusinessService service;

  StaffMenu({Key? key, required this.service}) : super(key: key);

  @override
  _StaffMenuState createState() => _StaffMenuState();
}

class _StaffMenuState extends State<StaffMenu> {
  List<Staff> staffList = [];
  List<Staff> removedStaffList = [];

  @override
  void initState() {
    super.initState();
    staffList = widget.service.staffList;
    removedStaffList = widget.service.removedStaffList;
  }

  void addStaff(Staff staff) {
    setState(() {
      staffList.add(staff);
      widget.service.staffList = staffList;
    });
  }

  void removeStaff(int tax) {
    setState(() {
      Staff? staff = staffList.firstWhere(
        (staff) => staff.tax == tax,
      );
      // ignore: unnecessary_null_comparison
      if (staff != null) {
        staffList.remove(staff);
        removedStaffList.add(staff);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Staff Management"),
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
                    builder: (context) => CreateAccount(
                      staffList: widget.service.staffList,
                      addStaff: addStaff,
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Create Account",
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
                    builder: (context) => UpdateAccount(
                      staffList: widget.service.staffList,
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
                  "Update Account",
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
                    builder: (context) => Deleteaccount(
                      staffList: widget.service.staffList,
                      removeStaff: removeStaff,
                      removedStaffList: widget.service.removedStaffList,
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
                  "Remove Account",
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
                    builder: (context) => RestoreAccount(
                      removedStaffList: widget.service.removedStaffList,
                      staffList: widget.service.staffList,
                      restoreStaff: (Staff staff) {
                        setState(() {
                          widget.service.removedStaffList.remove(staff);
                          widget.service.staffList.add(staff);
                        });
                      },
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
                  "Restore Account",
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
                      staffList: widget.service.staffList,
                      removedStaffList: widget.service.removedStaffList,
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
                  "View Staff Details",
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
