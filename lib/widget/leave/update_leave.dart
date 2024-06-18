import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/leave/update_leave_1.dart';

class UpdateLeavePage extends StatefulWidget {
  final AllowanceService allowanceService;

  const UpdateLeavePage({super.key, required this.allowanceService});

  @override
  State<UpdateLeavePage> createState() => _UpdateLeavePageState();
}

class _UpdateLeavePageState extends State<UpdateLeavePage> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Update Leave"),
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
                  prefixIcon: Icon(Icons.insert_drive_file),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ID Number';
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
                    if (_id != null && widget.allowanceService.isLeaveIdRegistered(_id!)) {
                      Leave leave = widget.allowanceService.repo.leaveList
                          .firstWhere((leave) => leave.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateLeave(
                            isLeaveIdRegistered: widget.allowanceService.isIdRegistered,
                           
                            leave: leave, updateLeaves: widget.allowanceService.updateLeaves,
                          ),
                        ),
                      ).then((_) {
                        setState(() {}); // Refresh the page to show updated data
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid ID number')),
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

 
}
