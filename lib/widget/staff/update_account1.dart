import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';

class Updatename extends StatefulWidget {
  final Staff staff;
  final Function(Staff) updateStaff;

  const Updatename({Key? key, required this.staff, required this.updateStaff})
      : super(key: key);

  @override
  State<Updatename> createState() => _UpdatenameState();
}

class _UpdatenameState extends State<Updatename> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _address;
  late int _age;
  late int _id;

  @override
  void initState() {
    super.initState();
    _name = widget.staff.name;
    _address = widget.staff.address;
    _age = widget.staff.age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Edit Details"),
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
                    labelText: "Enter Staff's New Name",
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
                  initialValue: widget.staff.tax.toString(),
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Staff's TAX Number",
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _address,
                  decoration: InputDecoration(
                    labelText: "Enter Staff's New Address",
                    prefixIcon: Icon(Icons.maps_home_work_rounded),
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
                TextFormField(
                  initialValue: _age.toString(),
                  decoration: InputDecoration(
                    labelText: "Enter Staff's New Age",
                    prefixIcon: Icon(Icons.attribution),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an age';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.parse(value!);
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.updateStaff(Staff(
                        name: _name,
                        tax: widget.staff.tax,
                        address: _address,
                        age: _age,
                        id: _id,
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
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
