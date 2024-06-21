import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/roster/updatepage_roster.dart';

class UpdateRoster extends StatefulWidget {
  final RosterService service;
  final List<Roster> rosters;
  const UpdateRoster({
    super.key,
    required this.service,
    required this.rosters,
  });

  @override
  State<UpdateRoster> createState() => _UpdateState();
}

class _UpdateState extends State<UpdateRoster> {
  final _formKey = GlobalKey<FormState>();
  int? _id;
  TextEditingController rosterNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.cyan,
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
                  prefixIcon: const Icon(Icons.numbers),
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
                    if (_id != null && widget.service.isIdRegistered(_id!)) {
                      Roster roster = widget.rosters
                          .firstWhere((roster) => roster.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatepageRoster(
                            isIdRegistered: widget.service.isIdRegistered,
                            updatedRoster: widget.service.updatedRoster,
                            roster: roster,
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
                child: const Text(
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
