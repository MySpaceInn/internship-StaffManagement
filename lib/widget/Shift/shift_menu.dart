import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/Shift/create_shift.dart';
import 'package:flutter_application_1/widget/Shift/delete_shift.dart';
import 'package:flutter_application_1/widget/Shift/list_shift.dart';
import 'package:flutter_application_1/widget/Shift/restore_shift.dart';
import 'package:flutter_application_1/widget/Shift/update_shift.dart';

class ShiftMenu extends StatefulWidget {
  final RosterService service;
  const ShiftMenu({super.key, required this.service});

  @override
  _ShiftMenuState createState() => _ShiftMenuState();
}

class _ShiftMenuState extends State<ShiftMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Shift Management"),
      ),
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
                    builder: (context) => CreateShift(
                      addShift: widget.service.addShiftList,
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
                  "Create Shift",
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
                    builder: (context) => UpdateShift(service: widget.service),
                  ),
                );
              },
              child: Container(
                padding:const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin:const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Update Shift",
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
                    builder: (context) => DeleteShift(isShiftIdRegistered: widget.service.isShiftIdRegistered, removeShift: widget.service.removeShift,),
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
                  "Remove Shift",
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
                    builder: (context) => RestoreShift(getRemovedShiftById: widget.service.getRemovedShiftById, restoreShift: widget.service.restoreShift,),
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
                  "Restore Shift",
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
                    builder: (context) => Viewdetails(
                      service: widget.service,
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
                  "View Shift Details",
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
