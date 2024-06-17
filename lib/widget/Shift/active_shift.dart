import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';

class ActiveShift extends StatelessWidget {
  final List<Shift> shifts;

  const ActiveShift({super.key, required this.shifts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Shift Details'),
      ),
      body: Center(
        child: shifts.isEmpty
            ? Text('There are no active shift details!')
            : ListView.builder(
                itemCount: shifts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                   
                    title: Text(
                        '''ID: ${shifts[index].id}
                        Start Time: ${shifts[index].startTime},
                         End Time: ${shifts[index].endTime}'''),
                  );
                },
              ),
      ),
    );
  }
}
