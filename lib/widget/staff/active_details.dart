import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';

class ActiveStaffDetails extends StatelessWidget {
  final List<Staff> staffList;

  ActiveStaffDetails({required this.staffList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Staff Details'),
      ),
      body: Center(
        child: staffList.isEmpty
            ? Text('There are no active staff details!')
            : ListView.builder(
                itemCount: staffList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(staffList[index].name),
                    subtitle: Text(
                        'ID: ${staffList[index].id}, PAN: ${staffList[index].tax}, Address: ${staffList[index].address}, Age: ${staffList[index].age}'),
                  );
                },
              ),
      ),
    );
  }
}
