import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';

class UpdateShiftPage extends StatefulWidget {
  final Function(Shift) updateShift;
  final Function(int) isShiftIdRegistered;
  final Shift shift;

  const UpdateShiftPage({super.key, required this.shift, required this.updateShift, required this.isShiftIdRegistered, });

  @override
  State<UpdateShiftPage> createState() => _UpdateShiftPageState();
}

class _UpdateShiftPageState extends State<UpdateShiftPage> {
  final _formKey = GlobalKey<FormState>();
  late String _startTime;
  late String _endTime;
  

  @override
  void initState() {
    super.initState();
    _startTime = widget.shift.startTime;
    _endTime = widget.shift.endTime;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text("Update Shift"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _startTime,
                  decoration: InputDecoration(
                    labelText: "Enter New Start New",
                    prefixIcon:const Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Start New';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _startTime = value!;
                  },
                ),
               const SizedBox(height: 10),
                TextFormField(
                  initialValue: _endTime,
                  decoration: InputDecoration(
                    labelText: "Enter  New End New",
                    prefixIcon:const Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter End New';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _endTime = value!;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Shift updateShift=(Shift(
                        startTime: _startTime,
                        endTime: _endTime,
                       
                        id: widget.shift.id,
                      ));
                      widget.updateShift(updateShift);
                      Navigator.pop(context);
                    }
                  },
                  child:const Text(
                    "Update",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
