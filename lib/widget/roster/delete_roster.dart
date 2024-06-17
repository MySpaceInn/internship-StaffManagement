// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/service/rostershift_service.dart';

// class DeleteRoster extends StatefulWidget {
//   final RosterService service;

//   const DeleteRoster({super.key, required this.service});

//   @override
//   State<DeleteRoster> createState() => _DeleteState();
// }

// class _DeleteState extends State<DeleteRoster> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Delete",
//           style: TextStyle(fontSize: 25),
//         ),
//         backgroundColor: Color.fromARGB(255, 149, 218, 228),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           TextField(
//             controller: _controller,
//             decoration: InputDecoration(
//                 labelText: "Enter ID to Delete",
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(50)))),
//             keyboardType: TextInputType.number,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 int id = int.tryParse(_controller.text) ?? -1;
//                 if (id > 0 && id <= widget.service.rosters.length) {
//                   setState(() {
//                     widget.service.rosters[id - 1].isDeleted = true;
//                   });
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Shift deleted successfully!'),
//                     ),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Invalid ID. Please try again.'),
//                     ),
//                   );
//                 }
//               },
//               child: Text("Delete"),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.black,
//                 backgroundColor: Colors.cyan,
//                 shadowColor: Colors.black,
//                 elevation: 5,
//                 padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                 textStyle: TextStyle(fontSize: 20),
//               ))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';
import 'package:flutter_application_1/widget/roster/deleted_roster.dart';

class DeleteRoster extends StatefulWidget {
  final RosterService service;
  const DeleteRoster({super.key,required this.service});

  @override
  State<DeleteRoster> createState() => _DeleteRosterState();
}

class _DeleteRosterState extends State<DeleteRoster> {
  final _formKey = GlobalKey<FormState>();
  int ? _id;
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Remove Roster"),
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
                  labelText: "Enter  ID Number To Delete",
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
                    if (_id != null && _isidRegistered(_id!)) {
                      widget.service.removeRoster(_id!);
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeletedRoster(
                            rosters:
                                widget.service.removeRosters,
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
    return widget.service.rosters
        .any((roster) => roster.id == id);
  }
}
