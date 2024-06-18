import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';

class RestoreAllowance extends StatefulWidget {
  final Function(int) getRemovedAllowanceById;
  final Function(Allowance) restoreAllowance;

  const RestoreAllowance(
      {super.key,
      required this.getRemovedAllowanceById,
      required this.restoreAllowance});

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
        title: const Text("Restore Allowance"),
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
              const SizedBox(height: 20),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null) {
                      Allowance? allowance =
                          widget.getRemovedAllowanceById(_id!);
                      if (allowance != null) {
                        widget.restoreAllowance(allowance);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Allowance restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Id not found in removed Allowance')),
                        );
                      }
                    }
                  }
                },
                child: const Text(
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
}
