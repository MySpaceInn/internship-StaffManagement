import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';

class ActiveShift extends StatelessWidget {
  const ActiveShift({super.key, required this.shifts});
  final List<Shift> shifts;

  @override
  Widget build(BuildContext context) {
    List<Shift> activeShifts =
        shifts.where((shift) => !shift.isDeleted).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Active Shifts')),
      body: activeShifts.isEmpty
          ? Center(child: Text('No active shifts are currently stored.'))
          : ListView(
              children: activeShifts
                  .map((shift) => ListTile(
                        title: Text('Staff: ${shift.name}'),
                        subtitle: Text('${shift.date} at ${shift.time}'),
                      ))
                  .toList(),
            ),
    );
  }
}
