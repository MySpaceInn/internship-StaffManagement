import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/roster/create_roster.dart';
import 'package:flutter_application_1/widget/roster/delete_roster.dart';
import 'package:flutter_application_1/widget/roster/list_roster.dart';
import 'package:flutter_application_1/widget/roster/restore_roster.dart';
import 'package:flutter_application_1/widget/roster/update_roster.dart';

class RosterMenu extends StatefulWidget {
  const RosterMenu({
    super.key,
    required this.service,
  });
  final RosterService service;

  @override
  State<RosterMenu> createState() => _RosterMenuState();
}

class _RosterMenuState extends State<RosterMenu> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateRoster(
                      addRoster: widget.service.addRoster,
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Create Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateRoster(
                      service: widget.service,
                      rosters: widget.service.getRoster(),
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Update Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteRoster(
                      removeRoster: widget.service.getRemoveRoster,
                      isIdRegistered: widget.service.isIdRegistered,
                      removedRoster: widget.service.getAllRomovedRoster(),
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Remove Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestoreRoster(
                      getRemovedRosterById: widget.service.getRemovedRosterById,
                      restoreRoster: widget.service.restoreRoster,
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Restore Roster",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListRoster(service: widget.service),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "View Rosters",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
