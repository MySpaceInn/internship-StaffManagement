import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';

class UpdatepageRoster extends StatefulWidget {
  final Function(Roster) updatedRoster;
  final Function(int) isIdRegistered;
  final Roster roster;

  const UpdatepageRoster({
    super.key,
    required this.roster,
    required this.updatedRoster,
    required this.isIdRegistered,
  });

  @override
  State<UpdatepageRoster> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatepageRoster> {
  final _formKey = GlobalKey<FormState>();
  late String _creatorName;
  late String _createdYear;

  late String _startedDate;
  late String _endDate;

  @override
  void initState() {
    super.initState();
    _creatorName = widget.roster.creatorName;
    _createdYear = widget.roster.createdYear;
    _startedDate = widget.roster.startDate;
    _endDate = widget.roster.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Edit Roster Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: widget.roster.id.toString(),
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Business ID",
                    prefixIcon: const Icon(Icons.numbers),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: _creatorName,
                  decoration: InputDecoration(
                    labelText: "Enter Creator New Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Creator name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _creatorName = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: _createdYear,
                  decoration: InputDecoration(
                    labelText: "Enter New Created Year",
                    prefixIcon: const Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Created Year';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _createdYear = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: _startedDate,
                  decoration: InputDecoration(
                    labelText: "Enter Roster Started Year",
                    prefixIcon: const Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Started Year';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _startedDate = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: _endDate,
                  decoration: InputDecoration(
                    labelText: "Enter Business End Date",
                    prefixIcon: const Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a End Year';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _endDate = value!;
                  },
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Roster updateRoster = Roster(
                        creatorName: _creatorName,
                        id: widget.roster.id,
                        createdYear: _createdYear,
                        startDate: _startedDate,
                        endDate: _endDate,
                      );
                      widget.updatedRoster(updateRoster);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
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
