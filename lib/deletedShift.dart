import 'package:flutter/material.dart';
import 'package:flutter_application_1/Roster.dart';

class Deletedshift extends StatelessWidget {
  const Deletedshift({super.key, required this.shifts});
  final List<Shift> shifts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Deleted Shifts"),
      ),
      body: shifts.isEmpty
          ? Center(child: Text('No Deleted shifts are currently stored.'))
          : ListView(
              children: shifts.map((shift) {
                if (shift.isDeleted) {
                  return ListTile(
                    title: Text('Name: ${shift.name}'),
                    subtitle: Text('Date: ${shift.date} at ${shift.time}'),
                  );
                } else {
                  return SizedBox.shrink(); 
                }
              }).toList(),
            ),
    );
  }
}
