import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/widget/roster/deleted_roster.dart';

class DeleteRoster extends StatefulWidget {

final Function(int) removeRoster;
final Function(int) isIdRegistered;
final List<Roster> removedRoster;
  const DeleteRoster({super.key,required this.removeRoster, required this.isIdRegistered, required this.removedRoster});

  @override
  State<DeleteRoster> createState() => _DeleteRosterState();
}

class _DeleteRosterState extends State<DeleteRoster> {
  final _formKey = GlobalKey<FormState>();
  int? _id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Remove Roster"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers),
                  labelText: "Enter  ID Number To Delete",
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
                    if (_id != null && widget.isIdRegistered(_id!)) {
                      widget.removeRoster(_id!);
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeletedRoster(
                            removeRoster: widget.removedRoster,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Deleted Successfully")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid id number')),
                      );
                    }
                  }
                },
                child: const Text(
                  "Delete",
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