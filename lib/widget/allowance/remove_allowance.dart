import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/widget/allowance/deleted_allowance.dart';

class DeleteAllowance extends StatefulWidget {
  final Function(int) removeAllowance;
  final Function(int) isIdRegistered;
  final List<Allowance> removedAllowances;

  const DeleteAllowance({
    Key? key,
    required this.removeAllowance,
    required this.isIdRegistered,
    required this.removedAllowances,
  }) : super(key: key);

  @override
  State<DeleteAllowance> createState() => _DeleteAllowanceState();
}

class _DeleteAllowanceState extends State<DeleteAllowance> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Remove Allowance"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Enter ID To Delete",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
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
             const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && widget.isIdRegistered(_id!)) {
                      widget.removeAllowance(_id!);
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeletedAllowance(
                          removedAllowances: widget.removedAllowances,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text("Deleted Successfully")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Invalid ID number')),
                      );
                    }
                  }
                },
                child:const Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
