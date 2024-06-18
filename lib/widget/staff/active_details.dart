import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';

class ActiveStaffDetails extends StatelessWidget {
  final List<Staff> activeStaff;
  ActiveStaffDetails({required this.activeStaff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Staff Details'),
      ),
      body: Center(
        child: activeStaff.isEmpty
            ? Text('There are no active staff details!')
            : ListView.builder(
                itemCount: activeStaff.length,
                itemBuilder: (context, index) {
                  Staff item = activeStaff[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                        'ID: ${item.id}, PAN: ${item.tax}, Address: ${item.address}, Age: ${item.age}'),
                  );
                },
              ),
      ),
    );
  }
}
