import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/widget/staff/update_account1.dart';

class UpdateAccount extends StatefulWidget {
  final List<Staff> staffList;

  const UpdateAccount({Key? key, required this.staffList}) : super(key: key);

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Update Account"),
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
                  prefixIcon: Icon(Icons.attach_money),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && _isidRegistered(_id!)) {
                      Staff staff = widget.staffList
                          .firstWhere((staff) => staff.id == _id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Updatename(
                            staff: staff,
                            updateStaff: _updateStaff,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid id number')),
                      );
                    }
                  }
                },
                child: Text(
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

  bool _isidRegistered(int id) {
    return widget.staffList.any((staff) => staff.id == id);
  }

  void _updateStaff(Staff updatedStaff) {
    setState(() {
      int index =
          widget.staffList.indexWhere((staff) => staff.id == updatedStaff.id);
      if (index != -1) {
        widget.staffList[index] = updatedStaff;
      }
    });
  }
}
