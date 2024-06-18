import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';

class DeletedLeaveDetails extends StatelessWidget {
  final List<Leave> removedLeave;

  DeletedLeaveDetails({required this.removedLeave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Leave Details'),
      ),
      body: Center(
        child: removedLeave.isEmpty
            ? Text('There are no deleted Leave details!')
            : ListView.separated(
                itemCount: removedLeave.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  Leave item = removedLeave[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                      'ID: ${item.id}, Duration: ${item.duration}, Address: ${item.address}, Type: ${item.type}',
                    ),
                  );
                },
              ),
      ),
    );
  }
}
