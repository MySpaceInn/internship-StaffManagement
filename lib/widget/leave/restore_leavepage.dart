import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';


class RestoreLeave extends StatefulWidget {
  final Function(int) getRemovedLeaveById;
  final Function(Leave) restoreLeave;

  const RestoreLeave({super.key,  required this.getRemovedLeaveById,
  required this.restoreLeave});

  @override
  State<RestoreLeave> createState() => _RestoreLeaveState();
}

class _RestoreLeaveState extends State<RestoreLeave> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Restore Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.insert_drive_file),
                  labelText: "Enter id Number To Restore",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a ID number';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _id = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null) {
                      Leave? leave = widget.getRemovedLeaveById(_id!);
                      if (leave != null) {
                        widget.restoreLeave(leave);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Leave restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('id number not found in removed leave')),
                        );
                      }
                    }
                  }
                },
                child: Text(
                  "Restore",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 
}
