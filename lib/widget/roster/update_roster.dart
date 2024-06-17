

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/widget/roster/updatepage_roster.dart';




class UpdateRoster extends StatefulWidget {
final List<Roster> rosters;
   UpdateRoster({super.key, required this.rosters,});
  
   
  @override
  State<UpdateRoster> createState() => _UpdateState();
}

class _UpdateState extends State<UpdateRoster> {
  final _formKey =GlobalKey<FormState>();
  int ? _id;
  TextEditingController rosterNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.cyan,
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter ID Number",
                  prefixIcon: Icon(Icons.numbers),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && _isidRegistered(_id! )) {
                      Roster roster = widget.rosters
                          .firstWhere((roster) => roster.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatepageRoster(
                            roster: roster,
                            updateRoster: _updateBusiness,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid id number')),
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

  bool _isidRegistered(int id) {
    return widget.rosters.any((roster) => roster.id == id);
  }

  void _updateBusiness(Roster updatedRoster) {
    setState(() {
      int index = widget.rosters
          .indexWhere((roster) => roster.id == updatedRoster.id);
      if (index != -1) {
        widget.rosters[index] = updatedRoster;
      }
    });
  }
}
