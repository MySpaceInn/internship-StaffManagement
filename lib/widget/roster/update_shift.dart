import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/roster_service.dart';
import 'package:flutter_application_1/widget/roster/update_page.dart';

class Update extends StatefulWidget {
  final RosterService service;

  const Update({super.key, required this.service});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController shiftNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: shiftNumberController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: "Enter Shift Number",
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                int shiftIndex = int.tryParse(shiftNumberController.text) ?? -1;
                if (shiftIndex > 0 &&
                    shiftIndex <= widget.service.shifts.length &&
                    !widget.service.shifts[shiftIndex - 1].isDeleted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdatePage(
                                service: widget.service,
                                shiftIndex: shiftIndex - 1,
                              )));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Invalid shift number or shift is deleted")));
                }
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.cyan,
                shadowColor: Colors.black,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
