import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';
import 'package:flutter_application_1/widget/roster/active_shift.dart';
import 'package:flutter_application_1/widget/roster/deleted_shift.dart';

// ignore: must_be_immutable
class ListShift extends StatefulWidget {
  ListShift({super.key, required this.Service});
  final Service;
  List<Shift> shifts = [];

  @override
  State<ListShift> createState() => _listShiftState();
}

class _listShiftState extends State<ListShift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Shift",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.cyanAccent,
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActiveShift(shifts: widget.Service.shifts),
                      ));
                },
                child: Text("Active Shift")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.cyanAccent,
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Deletedshift(shifts: widget.Service.shifts),
                      ));
                },
                child: Text("Deleted Shift")),
          ],
        ),
      ),
    );
  }
}
