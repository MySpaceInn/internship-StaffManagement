import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/allowance/update_allowancepage.dart';

class UpdateAllowance extends StatefulWidget {
  final AllowanceService allowanceService;
  final List<Allowance> allowanceList;

  const UpdateAllowance({
    Key? key,
    required this.allowanceService,
    required this.allowanceList,
  }) : super(key: key);

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
        title: const Text("Update Allowance"),
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
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && widget.allowanceService.isIdRegistered(_id!)) {
                      Allowance allowance = widget.allowanceList
                          .firstWhere((allowance) => allowance.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateAllowancePage(
                            isIdRegistered: widget.allowanceService.isIdRegistered,
                            updateAllowances: widget.allowanceService.updateAllowances,
                            allowance: allowance,
                          ),
                        ),
                      ).then((_) {
                        setState(() {}); // Refresh the page to show updated data
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid ID number')),
                      );
                    }
                  }
                },
                child: const Text(
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
