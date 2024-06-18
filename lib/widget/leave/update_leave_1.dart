import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/leave_model.dart';

class UpdateLeave extends StatefulWidget {
final Function(Leave) updateLeaves;
  final Function(int) isLeaveIdRegistered;


  final Leave leave;

  const UpdateLeave({
    Key? key,
    required this.updateLeaves,
    required this.leave, required this.isLeaveIdRegistered, 
  }) : super(key: key);

  @override
  State<UpdateLeave> createState() => _UpdateLeaveState();
}

class _UpdateLeaveState extends State<UpdateLeave> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _address;
  late String _duration;
  late String? _type;

  List<String> leaveTypes = [
    'Paid Annual Leave',
    'Unpaid Annual Leave',
    'Sick Leave',
  ];

  @override
  void initState() {
    super.initState();
    _name = widget.leave.name;
    _address = widget.leave.address;
    _duration = widget.leave.duration;
    _type = widget.leave.type;
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Edit Leave"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _duration,
                  decoration: InputDecoration(
                    labelText: "Enter Duration",
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter duration';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _duration = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _address,
                  decoration: InputDecoration(
                    labelText: "Enter Leave's New Address",
                    prefixIcon: Icon(Icons.location_city_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value!;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _type,
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
                      _type = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a leave type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
               ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Leave updatedLeave = Leave(
        name: _name,
        duration: _duration,
        address: _address,
        type: _type!,
        id: widget.leave.id,
      );
      widget.updateLeaves(updatedLeave);
      Navigator.pop(context);
    }
  },
  child: Text(
    "Update",
    style: TextStyle(color: Colors.white),
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
