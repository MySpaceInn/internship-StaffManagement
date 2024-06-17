

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';

class RestoreAllowance extends StatefulWidget {
  final AllowanceService allowanceService;

  const RestoreAllowance({Key? key, required this.allowanceService})
      : super(key: key);

  @override
  State<RestoreAllowance> createState() => _RestoreAllowanceState();
}

class _RestoreAllowanceState extends State<RestoreAllowance> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Restore Allowance"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers),
                  labelText: "Enter ID Number To Restore",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a id number';
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null) {
                      Allowance? allowance = _getAllowanceByid(_id!);
                      if (allowance != null) {
                        widget.allowanceService.restoreAllowance(allowance);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Allowance restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Id not found in removed Allowance')),
                        );
                      }
                    }
                  }
                },
                child: Text(
                  "Restore",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Allowance? _getAllowanceByid(int id) {
    try {
      return widget.allowanceService.repo.removedAllowanceList
          .firstWhere((allowance) => allowance.id == id);
    } catch (e) {
      return null;
    }
  }
}

