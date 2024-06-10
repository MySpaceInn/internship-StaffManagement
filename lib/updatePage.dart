import 'package:flutter/material.dart';
import 'package:flutter_application_1/Roster.dart';


class UpdatePage extends StatefulWidget {
  final Business service;
  final int shiftIndex;

  const UpdatePage({super.key, required this.service, required this.shiftIndex});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final shift = widget.service.shifts[widget.shiftIndex];
    nameController.text = shift.name;
    dateController.text = shift.date;
    timeController.text = shift.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                labelText: "Enter name",
                prefixIcon: Icon(Icons.person)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: dateController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.date_range),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                labelText: 'Date (YYYY-MM-DD)'),
            keyboardType: TextInputType.datetime,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: timeController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.timelapse),
                labelText: 'Time (HH:MM)',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                final newName = nameController.text;
                final newDate = dateController.text;
                final newTime = timeController.text;

                widget.service.shifts[widget.shiftIndex].name = newName;
                widget.service.shifts[widget.shiftIndex].date = newDate;
                widget.service.shifts[widget.shiftIndex].time = newTime;

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Shift updated successfully!")));
                Navigator.pop(context);
              },
              child: Text("Update"),
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
