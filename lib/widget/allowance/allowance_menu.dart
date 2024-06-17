import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/allowance/create_allowance.dart';
import 'package:flutter_application_1/widget/allowance/remove_allowance.dart';
import 'package:flutter_application_1/widget/allowance/restore_allowance.dart';
import 'package:flutter_application_1/widget/allowance/update_allowance.dart';
import 'package:flutter_application_1/widget/allowance/view_allowance_detailspage.dart';

class AllowanceMenu extends StatefulWidget {
  final AllowanceService allowanceService;

  AllowanceMenu({Key? key, required this.allowanceService}) : super(key: key);

  @override
  _AllowanceMenuState createState() => _AllowanceMenuState();
}

class _AllowanceMenuState extends State<AllowanceMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    builder: (context) => CreateAllowance(
                      allowanceService: widget.allowanceService,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Create Allowance",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateAllowance(
                      allowanceService: widget.allowanceService,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Update Allowance",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteAllowance(
                      allowanceService: widget.allowanceService,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Remove Allowance",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RestoreAllowance(allowanceService: widget.allowanceService),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Restore Account",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ViewAllowanceDetail(allowanceService: widget.allowanceService),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "View Allowance Details",
                  style: TextStyle(
                    color: Colors.white,
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
