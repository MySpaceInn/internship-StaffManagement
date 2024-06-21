import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';
import 'package:flutter_application_1/service/roster_repo.dart';

class CreateShift extends StatefulWidget {
final Function(Shift) addShift;
  const CreateShift({super.key, required this.addShift});

  @override
  _CreateShiftState createState() => _CreateShiftState();
}

class _CreateShiftState extends State<CreateShift> {
  final _formKey = GlobalKey<FormState>();
  String startTime = '';
  String endTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text("Shift's Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter StartTime",
                  prefixIcon:const Icon(Icons.time_to_leave),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onSaved: (value) {
                  startTime = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
             const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter End Time",
                  prefixIcon:const Icon(Icons.time_to_leave),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onSaved: (value) {
                  endTime = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Een Time';
                  }
                  return null;
                },
              ),
             const SizedBox(height: 15),
             const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    int newId = RosterRepo.getNextId();
                    Shift newShift = Shift(
                      startTime: startTime,
                      endTime: endTime,
                      id: newId,
                    );
                    widget.addShift(newShift);
                    ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text("Shift Created Successfully")));
                    Navigator.pop(context, newShift);
                  }
                },
                child:const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
