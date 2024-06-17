

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';

class CreateRoster extends StatefulWidget {
    final RosterService service;
  const CreateRoster({Key? key, required this.service})
      : super(key: key);

  @override
  State<CreateRoster> createState() => _CreateRosterState();
}
class _CreateRosterState extends State<CreateRoster> {
  final _formKey = GlobalKey<FormState>();
  String creatorName = '';
  String createdYear = '';
  String startDate = '';
  String endDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Roster Detail"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Creator Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onSaved: (value) {
                  creatorName = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter creatorNAme';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Created Year",
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onSaved: (value) {
                  createdYear = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter  CreatedYear';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Started Date",
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  startDate = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Started Date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter End Year",
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onSaved: (value) {
                  endDate = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter End Year';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    int newId = RosterService.getNextId();
                    Roster newRoster = Roster(
                      creatorName: creatorName,
                      createdYear: createdYear,
                      startDate: startDate,
                      endDate: endDate,
                      id: newId,
                    );
                    widget.service.addRoster(newRoster);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Roster Created Successfully")));
                    Navigator.pop(context, newRoster);
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
