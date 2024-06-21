import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/service/roster_repo.dart';

class CreateRoster extends StatefulWidget {

final Function(Roster) addRoster; 
  const CreateRoster({super.key, required this.addRoster});

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
        title: const Text("Roster Detail"),
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
                  prefixIcon: const Icon(Icons.person),
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
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Created Year",
                  prefixIcon: const Icon(Icons.date_range),
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
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Started Year",
                  prefixIcon: const Icon(Icons.date_range),
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
                    return 'Please enter Started Year';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter End Year",
                  prefixIcon: const Icon(Icons.date_range),
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
                    Roster newRoster = Roster(
                      creatorName: creatorName,
                      createdYear: createdYear,
                      startDate: startDate,
                      endDate: endDate,
                      id: newId,
                    );
                    widget.addRoster(newRoster);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Roster Created Successfully")));
                    Navigator.pop(context, newRoster);
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
