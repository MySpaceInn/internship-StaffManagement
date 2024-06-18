import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';

class CreateLeave extends StatefulWidget {
  final Function(Leave) createLeave;

   CreateLeave({Key? key, required this.createLeave}) : super(key: key);

  @override
  _CreateLeaveState createState() => _CreateLeaveState();
}

class _CreateLeaveState extends State<CreateLeave> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String address = '';
  String duration = '';
  String? type; 

  List<String> leaveTypes = [
    'Paid Annual Leave',
    'Unpaid Annual Leave',
    'Sick Leave',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Leave Detail"),
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
                  labelText: "Enter Staff's Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onSaved: (value) {
                  name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Duration",
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  duration = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a duration';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Leave's Address",
                  prefixIcon: Icon(Icons.location_city_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onSaved: (value) {
                  address = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: type,
                decoration: InputDecoration(
                  labelText: 'Select Leave Type',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: leaveTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    type = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a leave type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlue,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    int newId = Leave.getNextLeaveId();
                    Leave newLeave = Leave(
                      name: name,
                      duration: duration,
                      address: address,
                      type: type!,
                      id: newId,
                    );
                    widget.createLeave(newLeave);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Leave Created Successfully"),
                    ));
                    Navigator.pop(context, newLeave);
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
