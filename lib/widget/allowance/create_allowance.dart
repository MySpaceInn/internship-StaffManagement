import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';

class CreateAllowance extends StatefulWidget {
    final Function(Allowance) createAllowance;


   CreateAllowance({Key? key, required this.createAllowance}) : super(key: key);

  @override
  _CreateAllowanceState createState() => _CreateAllowanceState();
}

class _CreateAllowanceState extends State<CreateAllowance> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String amount;
  late String address;
  late String dateIssued;
  String? type; 

  List<String> allowanceTypes = [
    'Transport Allowance',
    'Medical Allowance',
    'Entertainment Allowance',
    'Other Allowance',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Allowance Detail"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Name",
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
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              const  SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Amount",
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    amount = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                ),
            const    SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Address",
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
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
           const     SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Date Issued",
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                  onSaved: (value) {
                    dateIssued = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the date issued';
                    }
                    return null;
                  },
                ),
           const     SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Type',
                    prefixIcon: Icon(Icons.category),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  value: type,
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
             const   SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      int newId = Allowance.getNextId();
                      Allowance newAllowance = Allowance(
                        id: newId,
                        name: name,
                        amount: amount,
                        address: address,
                        dateIssued: dateIssued,
                        type: type!,
                      );
                      widget.createAllowance(newAllowance);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:  Text("Allowance Created Successfully"),
                      ));
                      Navigator.pop(context, newAllowance);
                    }
                  },
                  child:const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
