import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/model/shift.dart';
import 'package:flutter_application_1/widget/Shift/update_page.dart';

class UpdateShift extends StatefulWidget {
  final Roster roster;

  const UpdateShift({super.key, required this.roster});

  @override
  State<UpdateShift> createState() => _UpdateShiftState();
}

class _UpdateShiftState extends State<UpdateShift> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Update Shift"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter ID Number",
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a ID Number';
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && _isidRegistered(_id!)) {
                      Shift shift = widget.roster.shifts
                          .firstWhere((shift) => shift.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateShiftPage(
                            shift: shift,
                            updateShift: _updateShift,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid id number')),
                      );
                    }
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isidRegistered(int id) {
    return widget.roster.shifts.any((shift) => shift.id == id);
  }

  void _updateShift(Shift updatedShift) {
    setState(() {
      int index = widget.roster.shifts
          .indexWhere((shift) => shift.id == updatedShift.id);
      if (index != -1) {
        widget.roster.shifts[index] = updatedShift;
      }
    });
  }
}
