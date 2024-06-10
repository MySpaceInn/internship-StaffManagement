import 'package:flutter/material.dart';
import 'package:flutter_application_1/Roster.dart';

class Restore extends StatefulWidget {
  const Restore({super.key, required this.service});
  final Business service;

  @override
  State<Restore> createState() => _RestoreState();
}

class _RestoreState extends State<Restore> {
  final TextEditingController _controller = TextEditingController();

  void _restoreShift() {
    final id = int.tryParse(_controller.text);
    if (id != null && id > 0 && id <= widget.service.shifts.length) {
      setState(() {
        widget.service.restoreShiftById(id - 1);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Shift restored successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid ID. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Restore", style: TextStyle(fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: "Enter ID",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.cyanAccent,
                shadowColor: Colors.black, 
                elevation: 5, 
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: _restoreShift,
              child: Text("Restore"),
            ),
          ],
        ),
      ),
    );
  }
}
