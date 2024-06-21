import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/Shift/shift_menu.dart';

class ActiveRoster extends StatelessWidget {
  final RosterService service;
  final List<Roster>  getRoster;
  const ActiveRoster(
      {super.key, required this.service, required this.getRoster});

  @override
  Widget build(BuildContext context) {
    int activeRosterNumber = getRoster.length;
    return Scaffold(
      appBar: AppBar(title: const Text('Active Roster')),
      body: Center(
        child: getRoster.isEmpty
            ? const Text('There are no active Roster details!')
            : ListView.builder(
                itemCount: activeRosterNumber,
                itemBuilder: (context, index) {
                  Roster item = getRoster[index];

                  return ListTile(
                    title: Text("Creator Name: ${item.creatorName}"),
                    subtitle: Text('''ID: ${item.id}
                         Created Year: ${item.createdYear},
                          Started Year: ${item.startDate},
                          End Year: ${item.endDate},
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
                              service: service,
                            ),
                          ),
                        );
                      },
                      child: const Text("Manage Shift"),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
