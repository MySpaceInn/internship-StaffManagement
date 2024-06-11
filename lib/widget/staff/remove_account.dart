import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/widget/staff/delete_details.dart';

class Deleteaccount extends StatefulWidget {
  final List<Staff> staffList;
  final Function(int) removeStaff;
  final List<Staff> removedStaffList;

  const Deleteaccount({
    Key? key,
    required this.staffList,
    required this.removeStaff,
    required this.removedStaffList,
  }) : super(key: key);

  @override
  State<Deleteaccount> createState() => _DeleteaccountState();
}

class _DeleteaccountState extends State<Deleteaccount> {
  final _formKey = GlobalKey<FormState>();
  int? _tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Remove Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.attach_money),
                  labelText: "Enter Registered TAX Number To Delete",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a tax number';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _tax = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_tax != null && _istaxRegistered(_tax!)) {
                      widget.removeStaff(_tax!);
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeleteStaffDetails(
                            staffList: widget.removedStaffList,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Deleted Successfully")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid tax number')),
                      );
                    }
                  }
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _istaxRegistered(int tax) {
    return widget.staffList.any((staff) => staff.tax == tax);
  }
}
