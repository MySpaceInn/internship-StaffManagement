import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';

class RestoreRoster extends StatefulWidget {
  final RosterService service;
  const RestoreRoster({super.key, required this.service,});

 

  @override
  State<RestoreRoster> createState() => _RestoreState();
}

class _RestoreState extends State<RestoreRoster> {
final _formKey=GlobalKey<FormState>();
int ? _id;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Restore", style: TextStyle(fontSize: 25)),
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Enter ID Number To Restore",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null) {
                      Roster? roster = _getRosterByid(_id!);
                      if (roster != null) {
                        widget.service.restoreRoster(roster);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Roster restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'ID number not found in removed Roster')),
                        );
                      }
                    }
                  }
                },
                child: Text(
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

  Roster? _getRosterByid(int id) {
    try {
      return widget.service.removeRosters
          .firstWhere((roster) => roster.id == id);
    } catch (e) {
      return null;
    }
  }
}
