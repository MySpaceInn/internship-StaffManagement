
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/allowance/active_allowance.dart';
import 'package:flutter_application_1/widget/allowance/deleted_allowance.dart';


class ViewAllowanceDetail extends StatefulWidget {
  final AllowanceService allowanceService;

  ViewAllowanceDetail({
    super.key,
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
          children: [
             SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ActiveAllowance(allowanceService: widget.allowanceService),
                  ),
                );
              },
              child: Text("View Active allowance Details"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeletedAllowance(
                          
                                 allowanceService: widget.allowanceService,)));
              },
              child: Text("View Deleted allowance Details"),
            ),
          ],
        ),
      ),
    );
  }
}

