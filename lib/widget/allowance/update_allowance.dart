import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/allowance/update_allowancepage.dart';

class UpdateAllowance extends StatefulWidget {
  final AllowanceService allowanceService;

  const UpdateAllowance({Key? key, required this.allowanceService, })
      : super(key: key);

  @override
  State<UpdateAllowance> createState() => _UpdateAllowanceState();
}

class _UpdateAllowanceState extends State<UpdateAllowance> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Update Allowance"),
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
                    borderRadius: BorderRadius.circular(15),
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
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && _isIdRegistered(_id!)) {
                      Allowance allowance = widget.allowanceService.repo.allowanceList
                          .firstWhere((allowance) => allowance.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateAllowancePage(
                            allowanceService: widget.allowanceService,
                            allowance: allowance,
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

  bool _isIdRegistered(int id) {
    return widget.allowanceService.repo.allowanceList.any((allowance) => allowance.id == id);
  }
}
