import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';

class ActiveLeaveDetails extends StatelessWidget {
  final List<Leave> activeLeave;

  ActiveLeaveDetails({
    super.key,
    required this.activeLeave,
  });

  @override
  Widget build(BuildContext context) {
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
                      'ID: ${item.id}, Duration: ${item.duration}, Name: ${item.name}, Address: ${item.address}, Type: ${item.type}',
                    ),
                  );
                },
              ),
      ),
    );
  }
}
