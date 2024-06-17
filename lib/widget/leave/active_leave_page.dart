import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';

class ActiveLeaveDetails extends StatelessWidget {
  final AllowanceService allowanceService; 

  ActiveLeaveDetails({super.key, required this.allowanceService});

  @override
  Widget build(BuildContext context) {
           List<Leave>activeLeave = allowanceService.getActiveLeaves() ;

    return Scaffold(
      appBar: AppBar(
        title: Text('Active Leave Details'),
      ),
      body: Center(
        child: activeLeave.isEmpty
            ? Text('There are no active Leave details!')
            : ListView.builder(
                itemCount: activeLeave.length,
                itemBuilder: (context, index) {
                  Leave item = activeLeave[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                        'ID: ${item.id},duration: ${item.duration} name: ${item.name}, Address: ${item.address}, type: ${item.type}'),
                  );
                },
              ),
      ),
    );
  }
}
