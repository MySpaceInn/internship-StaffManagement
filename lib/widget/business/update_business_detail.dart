import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';

class UpdateOrganaization extends StatefulWidget {
  final Business business;
  final Function(Business) updateBusiness;

  const UpdateOrganaization({
    Key? key,
    required this.business,
    required this.updateBusiness,
  }) : super(key: key);

  @override
  State<UpdateOrganaization> createState() => _UpdateOrganaizationState();
}

class _UpdateOrganaizationState extends State<UpdateOrganaization> {
  final _formKey = GlobalKey<FormState>();
  late String _businessName;
  late String _ownerName;
  late int _tax;
  late String _location;
  late String _registeredDate;

  @override
  void initState() {
    super.initState();
    _businessName = widget.business.businessName;
    _location = widget.business.location;
    _registeredDate = widget.business.registeredDate;
    _tax = widget.business.tax;
    _ownerName = widget.business.ownerName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Edit Business Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: widget.business.id.toString(),
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Business ID",
                    prefixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _businessName,
                  decoration: InputDecoration(
                    labelText: "Enter Business New Name",
                    prefixIcon: Icon(Icons.business),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a business name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _businessName = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _ownerName,
                  decoration: InputDecoration(
                    labelText: "Enter Owner New Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an owner name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _ownerName = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _location,
                  decoration: InputDecoration(
                    labelText: "Enter Business Location",
                    prefixIcon: Icon(Icons.maps_home_work_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _location = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _registeredDate,
                  decoration: InputDecoration(
                    labelText: "Enter Business Registered Date",
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a registered date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _registeredDate = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: _tax.toString(),
                  decoration: InputDecoration(
                    labelText: "Enter Tax Number",
                    prefixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a tax number';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tax = int.parse(value!);
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.updateBusiness(
                        Business(
                          businessName: _businessName,
                          id: widget.business.id,
                          location: _location,
                          registeredDate: _registeredDate,
                          tax: _tax,
                          ownerName: _ownerName,
                        ),
                      );
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
