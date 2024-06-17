import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/model/shift.dart';



class RestoreShift extends StatefulWidget {
  final Roster roster;

  const RestoreShift({super.key, required this.roster});

  @override
  State<RestoreShift> createState() => _RestoreAccountState();
}

class _RestoreAccountState extends State<RestoreShift> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Restore Shift"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Enter ID Number To Restore",
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
                      Shift? shift = _getShiftByid(_id!);
                      if (shift != null) {
                        widget.roster.restoreShift(shift);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Shift restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('id number not found in removed shift')),
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

  Shift? _getShiftByid(int id) {
    try {
      return widget.roster.removeshifts
          .firstWhere((shift) => shift.id == id);
    } catch (e) {
      return null;
    }
  }
}
