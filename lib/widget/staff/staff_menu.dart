import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/widget/staff/create_account.dart';
import 'package:flutter_application_1/widget/staff/remove_account.dart';
import 'package:flutter_application_1/widget/staff/restore_account.dart';
import 'package:flutter_application_1/widget/staff/update_account.dart';
import 'package:flutter_application_1/widget/staff/view_details.dart';

class StaffMenu extends StatefulWidget {
  final BusinessService businessService;

  StaffMenu({Key? key, required this.businessService}) : super(key: key);

  @override
  _StaffMenuState createState() => _StaffMenuState();
}

class _StaffMenuState extends State<StaffMenu> {
  @override
  void initState() {
    super.initState();
  }

  void addStaff(Staff staff) {
    setState(() {
      widget.businessService.addStaff(staff);
    });
  }

  void removeStaff(int tax) {
    setState(() {
      Staff? staff = widget.businessService.getStaffs().firstWhere(
            (staff) => staff.tax == tax,
          );
      if (staff != null) {
        widget.businessService.getStaffs().remove(staff);
        widget.businessService.getRemovedStaffs().add(staff);
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
                      createStaff: widget.businessService.addStaff,
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
                    builder: (context) =>
                        UpdateAccount(businessService: widget.businessService),
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
                        getRemovedStaff:
                            widget.businessService.getRemovedStaffs,
                        removeStaffById: widget.businessService.removeStaff),
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
                      restoreStaff: widget.businessService.restoreStaff,
                      removedStaffs: widget.businessService.getRemovedStaffs(),
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
                    builder: (context) =>
                        Viewdetails(businessService: widget.businessService),
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
