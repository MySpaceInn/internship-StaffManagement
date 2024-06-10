import 'package:flutter/material.dart';
import 'Roster.dart';

class Create extends StatefulWidget {
  Create({super.key, required this.service});
  final Business service;

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  void _submit() {
    final String name = nameController.text;
    final String date = dateController.text;
    final String time = timeController.text;

    if (name.isNotEmpty && date.isNotEmpty && time.isNotEmpty) {
      widget.service.createShiftWithParameters(name, date, time);
      
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Done'),
          content: Text('Successfully Created'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('All fields are required'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create", style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: "Enter name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.date_range),
                labelText: 'Date (YYYY-MM-DD)',
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 15),
            TextField(
              controller: timeController,
              decoration: InputDecoration(
                labelText: 'Time (HH:MM)',
                prefixIcon: Icon(Icons.timelapse),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.cyanAccent,
                shadowColor: Colors.black,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: _submit,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
