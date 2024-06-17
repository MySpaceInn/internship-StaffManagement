import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/Shift/shift_menu.dart';

class ActiveRoster extends StatelessWidget {
  final RosterService service;
  const ActiveRoster({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Active Roster')),
      body: Center(
        child: service.rosters.isEmpty
            ? Text('There are no active Roster details!')
            : ListView.builder(
                itemCount: service.rosters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        "Creator Name: ${service.rosters[index].creatorName}"),
                    subtitle: Text('''ID: ${service.rosters[index].id}
                         Created Year: ${service.rosters[index].createdYear},
                          Started Year: ${service.rosters[index].startDate},
                          End Year: ${service.rosters[index].endDate},
                           '''),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShiftMenu(
                              roster: service.rosters[index],
                            ),
                          ),
                        );
                      },
                      child: Text("Manage Shift"),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
