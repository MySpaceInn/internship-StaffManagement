import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';

class RestoreAccount extends StatefulWidget {
  final Function(Staff) restoreStaff;
  final List<Staff> removedStaffs;

  const RestoreAccount({
    super.key,
    required this.restoreStaff,
    required this.removedStaffs,
  });

  @override
  State<RestoreAccount> createState() => _RestoreAccountState();
}

class _RestoreAccountState extends State<RestoreAccount> {
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
                  prefixIcon: Icon(Icons.attach_money),
                  labelText: "Enter ID Number To Restore",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ID number';
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
                      Staff? staff = _getStaffById(_id!);
                      if (staff != null) {
                        widget.restoreStaff(staff);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Staff restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('ID number not found in removed staff')),
                        );
                      }
                    }
                  }
                },
                child: Text(
                  "Restore",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Staff? _getStaffById(int id) {
    try {
      return widget.removedStaffs.firstWhere((staff) => staff.id == id);
    } catch (e) {
      return null;
    }
  }
}
