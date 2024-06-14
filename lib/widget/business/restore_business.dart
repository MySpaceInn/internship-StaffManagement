import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';

class RestoreBusiness extends StatefulWidget {
  final List<Business> removedBusinessList;
  final List<Business> businessList;
  final void Function(Business business) restoreBusiness;

  const RestoreBusiness({
    Key? key,
    required this.removedBusinessList,
    required this.businessList,
    required this.restoreBusiness,
  }) : super(key: key);

  @override
  State<RestoreBusiness> createState() => _RestoreBusinessState();
}

class _RestoreBusinessState extends State<RestoreBusiness> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Restore Business"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null) {
                      Business? business = _getBusinessByid(_id!);
                      if (business != null) {
                        widget.restoreBusiness(business);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Business restored successfully')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'tax number not found in removed Business')),
                        );
                      }
                    }
                  }
                },
                child: Text(
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

  Business? _getBusinessByid(int id) {
    try {
      return widget.removedBusinessList
          .firstWhere((business) => business.id == id);
    } catch (e) {
      return null;
    }
  }
}
