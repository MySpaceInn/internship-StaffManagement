import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/service/business_service.dart';

class DeleteStaffDetails extends StatelessWidget {
  final List<Staff> deleteStaff;
  DeleteStaffDetails({required this.deleteStaff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Staff Details'),
      ),
      body: Center(
        child: deleteStaff.isEmpty
            ? Text('There are no deleted staff details!')
            : ListView.builder(
                itemCount: deleteStaff.length,
                itemBuilder: (context, index) {
                  Staff item = deleteStaff[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                        'ID: ${item.id} PAN: ${item.tax}, Address: ${item.address}, Age: ${item.age}'),
                  );
                },
              ),
      ),
    );
  }
}
