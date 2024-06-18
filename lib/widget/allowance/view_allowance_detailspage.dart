import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/allowance/active_allowance.dart';
import 'package:flutter_application_1/widget/allowance/deleted_allowance.dart';

class ViewAllowanceDetail extends StatefulWidget {
  final AllowanceService allowanceService;

  ViewAllowanceDetail({
    Key? key,
    required this.allowanceService,
  });

  @override
  State<ViewAllowanceDetail> createState() => _ViewAllowanceDetailState();
}

class _ViewAllowanceDetailState extends State<ViewAllowanceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Allowance Details"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActiveAllowance(
                      allowanceService: widget.allowanceService, activeAllowances: widget.allowanceService.getAllowance(),
                     
                    ),
                  ),
                );
              },
              child: Text("View Active Allowance Details"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeletedAllowance(
                       removedAllowances: widget.allowanceService.getRemovedAllowance(),
                    ),
                  ),
                );
              },
              child: Text("View Deleted Allowance Details"),
            ),
          ],
        ),
      ),
    );
  }
}
