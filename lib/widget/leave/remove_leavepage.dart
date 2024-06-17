

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/leave/deleted_leavepage.dart';

class DeleteLeave extends StatefulWidget {
  final AllowanceService allowanceService;

  const DeleteLeave({
    super.key,
    required this.allowanceService,
  });

  @override
  State<DeleteLeave> createState() => _DeleteLeaveState();
}

class _DeleteLeaveState extends State<DeleteLeave> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Remove Leave"),
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
                  labelText: "Enterid To Delete",
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
                    if (_id != null && _isidRegistered(_id!)) {
                      widget.allowanceService.removeLeave(_id!);
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeletedLeaveDetails(
                            allowanceService: widget.allowanceService, 
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Deleted Successfully")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid id number')),
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

  bool _isidRegistered(int id) {
    return widget.allowanceService.repo.leaveList.any((leave) => leave.id == id);
  }
}
