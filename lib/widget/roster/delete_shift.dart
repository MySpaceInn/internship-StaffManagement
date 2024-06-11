import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/service/roster_service.dart';

class delete extends StatefulWidget {
  final RosterService service;

  const delete({super.key, required this.service});

  @override
  State<delete> createState() => _DeleteState();
}

class _DeleteState extends State<delete> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Delete",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Color.fromARGB(255, 149, 218, 228),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                labelText: "Enter ID to Delete",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                int id = int.tryParse(_controller.text) ?? -1;
                if (id > 0 && id <= widget.service.shifts.length) {
                  setState(() {
                    widget.service.shifts[id - 1].isDeleted = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Shift deleted successfully!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid ID. Please try again.'),
                    ),
                  );
                }
              },
              child: Text("Delete"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.cyan,
                shadowColor: Colors.black,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
