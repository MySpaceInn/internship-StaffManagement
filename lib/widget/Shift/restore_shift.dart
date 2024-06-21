import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';



class RestoreShift extends StatefulWidget {
  const RestoreShift({super.key, required this.getRemovedShiftById, required this.restoreShift, });
final Function(int) getRemovedShiftById;
  final Function(Shift) restoreShift;

  @override
  State<RestoreShift> createState() => _RestoreAccountState();
}

class _RestoreAccountState extends State<RestoreShift> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text("Restore Shift"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon:const Icon(Icons.numbers),
                  labelText: "Enter ID Number To Restore",
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
                    if (_id != null) {
                      Shift? shift = widget.getRemovedShiftById(_id!);
                      if (shift != null) {
                        widget.restoreShift(shift);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Shift restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                              content:
                                  Text('id number not found in removed shift')),
                        );
                      }
                    }
                  }
                },
                child:const Text(
                  "Restore",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  
}
