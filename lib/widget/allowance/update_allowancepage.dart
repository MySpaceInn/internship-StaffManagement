import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';

class UpdateAllowancePage extends StatefulWidget {
  final AllowanceService allowanceService;
  final Allowance allowance;

  const UpdateAllowancePage({
    Key? key,
    required this.allowanceService,
    required this.allowance,
  }) : super(key: key);

  @override
  State<UpdateAllowancePage> createState() => _UpdateAllowancePageState();
}

class _UpdateAllowancePageState extends State<UpdateAllowancePage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String address;
  late String dateIssued;
  late String amount; 
  String? type;

  List<String> allowanceTypes = [
    'Transport Allowance',
    'Medical Allowance',
    'Entertainment Allowance',
    'Other Allowance',
  ];

  @override
  void initState() {
    super.initState();
    name = widget.allowance.name;
    type = widget.allowance.type;
    dateIssued = widget.allowance.dateIssued;
    address = widget.allowance.address;
    amount = widget.allowance.amount; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Edit Allowance Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: widget.allowance.id.toString(),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Allowance ID",
                  prefixIcon: Icon(Icons.confirmation_number),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(
                  labelText: "Enter Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an allowance name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: address,
                decoration: InputDecoration(
                  labelText: "Enter Location",
                  prefixIcon: Icon(Icons.location_city_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
                onSaved: (value) {
                  address = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: amount,
                decoration: InputDecoration(
                  labelText: "Enter Amount",
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  amount = value!;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: type,
                decoration: InputDecoration(
                  labelText: 'Select Type',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                items: allowanceTypes.map((String value) {
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
                    return 'Please select an allowance type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: dateIssued,
                decoration: InputDecoration(
                  labelText: "Enter Issued Date",
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter issued date';
                  }
                  return null;
                },
                onSaved: (value) {
                  dateIssued = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Allowance updatedAllowance = Allowance(
                      id: widget.allowance.id,
                      name: name,
                      type: type!,
                      dateIssued: dateIssued,
                      address: address,
                      amount: amount,
                    );
                    widget.allowanceService.updateAllowances(updatedAllowance);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlue,
                ),
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
