import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/allowance/deleted_allowance.dart';



class DeleteAllowance extends StatefulWidget {
  final AllowanceService allowanceService;

  const DeleteAllowance({Key? key, required this.allowanceService})
      : super(key: key);

  @override
  State<DeleteAllowance> createState() => _DeleteAllowanceState();
}

class _DeleteAllowanceState extends State<DeleteAllowance> {
  final _formKey = GlobalKey<FormState>();
  int? _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Remove Allowance"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  labelText: "Enter  ID  To Delete",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_id != null && _isidRegistered(_id!)) {
                      widget.allowanceService.removeAllowance(_id!);
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeletedAllowance(
                            allowanceService: widget.allowanceService, 
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Deleted Successfully")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid id number')),
                      );
                    }
                  }
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isidRegistered(int id) {
    return widget.allowanceService.repo.allowanceList
        .any((allowannce) => allowannce.id == id);
  }
}
