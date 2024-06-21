import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/Shift/deleted_shift.dart';

class DeleteShift extends StatefulWidget {
  final Function(int) removeShift;
  final bool Function(int) isShiftIdRegistered;
  const DeleteShift({
    super.key,
    required this.removeShift,
    required this.isShiftIdRegistered,
  });

  @override
  State<DeleteShift> createState() => _DeleteShiftState();
}

class _DeleteShiftState extends State<DeleteShift> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Delete Shift"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers),
                  labelText: "Enter ID Number To Delete",
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
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && widget.isShiftIdRegistered(_id!)) {
                      widget.removeShift(_id!);
                      // Navigator.pop(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DeletedShift(
                      //       removedShift: widget.removeShift(),
                      //     ),
                      //   ),
                      // );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Deleted Successfully")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid ID number')),
                      );
                    }
                  }
                },
                child: const Text(
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
}
