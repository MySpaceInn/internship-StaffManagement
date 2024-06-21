import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';

class ActiveShift extends StatelessWidget {
  final List<Shift> activeShift;
  const ActiveShift({super.key, required this.activeShift});

  @override
  Widget build(BuildContext context) {
    int activeShiftNumber = activeShift.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Shift Details'),
      ),
      body: Center(
        child: activeShift.isEmpty
            ? const Text('There are no active shift details!')
            : ListView.builder(
                itemCount: activeShiftNumber,
                itemBuilder: (context, index) {
                  Shift item = activeShift[index];
                  return ListTile(
                    title: Text('''ID: ${item.id}
                        Start Time: ${item.startTime},
                         End Time: ${item.endTime}'''),
                  );
                },
              ),
      ),
    );
  }
}
