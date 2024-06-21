import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';

class RestoreRoster extends StatefulWidget {
final Function(int) getRemovedRosterById;
final Function(Roster) restoreRoster;
  const RestoreRoster({
    super.key,
    required this.getRemovedRosterById, required this.restoreRoster, 
  });

  @override
  State<RestoreRoster> createState() => _RestoreState();
}

class _RestoreState extends State<RestoreRoster> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Restore", style: TextStyle(fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers),
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
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null) {
                      Roster? roster = widget.getRemovedRosterById(_id!);
                      if (roster != null) {
                        widget.restoreRoster(roster);
                        ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                              content: Text('Roster restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                        const  SnackBar(
                              content: Text(
                                  'ID number not found in removed Roster')),
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
