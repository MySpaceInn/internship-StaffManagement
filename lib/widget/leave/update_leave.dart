import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';

class UpdateLeavePage extends StatefulWidget {
  final AllowanceService service;

  const UpdateLeavePage({super.key, required this.service});

  @override
  State<UpdateLeavePage> createState() => _UpdateLeavePageState();
}

class _UpdateLeavePageState extends State<UpdateLeavePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Leave"),
      ),
//       body: ListView.builder(
//         itemCount: activeLeaves.length,
//         itemBuilder: (context, index) {
//           String name = activeLeaves[index];
//           String details = widget.service.leaves[name] ?? '';

//           return ListTile(
//             title: Text("Staff: $name"),
//             subtitle: Text(details),
//             trailing: ElevatedButton(
//               onPressed: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EditLeavePage(service: widget.service, staffName: name),
//                   ),
//                 );

//                 if (result != null && result == 'updated') {
//                   setState(() {}); // Refresh the list after update
//                 }
//               },
//               child: Text("Edit"),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class EditLeavePage extends StatefulWidget {
//   final Allowance service;
//   final String staffName;

//   const EditLeavePage({super.key, required this.service, required this.staffName});

//   @override
//   State<EditLeavePage> createState() => _EditLeavePageState();
// }

// class _EditLeavePageState extends State<EditLeavePage> {
//   late TextEditingController _durationController;
//   late String _leaveType;

//   @override
//   void initState() {
//     super.initState();
//     _durationController = TextEditingController();
//     // Extract current leave details
//     String details = widget.service.leaves[widget.staffName] ?? '';
//     List<String> parts = details.split(', Type: ');
//     _durationController.text = parts[0].replaceFirst('Duration: ', '');
//     _leaveType = parts.length > 1 ? parts[1] : 'Paid Annual Leave';
//   }

//   @override
//   void dispose() {
//     _durationController.dispose();
//     super.dispose();
//   }

//   void _updateLeave() {
//     String updatedDuration = _durationController.text;
//     String updatedType = _leaveType;

//     widget.service.updateLeave(widget.service., updatedDuration, updatedType);

//     Navigator.pop(context, 'updated');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Leave for ${widget.staffName}"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _durationController,
//               decoration: InputDecoration(labelText: "Duration"),
//             ),
//             DropdownButton<String>(
//               value: _leaveType,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _leaveType = newValue!;
//                 });
//               },
//               items: <String>['Paid Annual Leave', 'Unpaid Annual leave', 'Sick Leave']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _updateLeave,
//               child: Text("Update"),
//             ),
//           ],
//         ),
//       ),
    );
  }
}
