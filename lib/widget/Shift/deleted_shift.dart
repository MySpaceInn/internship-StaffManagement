import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';

class Deletedshift extends StatelessWidget {
  final List<Shift> shifts;

  Deletedshift({required this.shifts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Shift Details'),
      ),
      body: Center(
        child: shifts.isEmpty
            ? Text('There are no deleted Shift details!')
            : ListView.builder(
                itemCount: shifts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                  
                    subtitle: Text(
                        'ID: ${shifts[index].id} Started Time: ${shifts[index].startTime}, End Time: ${shifts[index].endTime}'),
                  );
                },
              ),
      ),
    );
  }
}
