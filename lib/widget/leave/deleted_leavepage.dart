import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';

class DeletedLeaveDetails extends StatelessWidget {
  final AllowanceService allowanceService;

  DeletedLeaveDetails({required this.allowanceService,});

  @override
  Widget build(BuildContext context) {
    List<Leave>removedLeave=allowanceService.getRemovedLeave();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Leave Details'),
      ),
      body: Center(
        child: removedLeave.isEmpty
            ? Text('There are no deleted Leave details!')
            : ListView.builder(
              
                itemCount: removedLeave.length,
                itemBuilder: (context, index) {
                  Leave iteam=(removedLeave[index]);
                  return ListTile(
                    title: Text(iteam.name),
                    subtitle: Text(
                        'ID: ${iteam.id} duration: ${iteam.duration}, Address: ${iteam.address}, type: ${iteam.type}'),
                  );
                },
              ),
      ),
    );
  }
}
