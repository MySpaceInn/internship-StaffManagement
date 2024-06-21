import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/Shift/update_page.dart';

class UpdateShift extends StatefulWidget {
final RosterService service;
  const UpdateShift({super.key, required this.service});

  @override
  State<UpdateShift> createState() => _UpdateShiftState();
}

class _UpdateShiftState extends State<UpdateShift> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text("Update Shift"),
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
                  prefixIcon:const Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a ID Number';
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
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && widget.service.isShiftIdRegistered(_id!)) {
                      Shift shift = widget.service.rosterRepo.shifts
                          .firstWhere((shift) => shift.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateShiftPage(
                            updateShift: widget.service.updatedShift,
                            shift: shift, isShiftIdRegistered: widget.service.isShiftIdRegistered,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Invalid id number')),
                      );
                    }
                  }
                },
                child:const Text(
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
