import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/shift.dart';

class DeletedShift extends StatelessWidget {
final List<Shift> removedShift;
  const DeletedShift({super.key, required this.removedShift});

  @override
  Widget build(BuildContext context) {
    int removeShiftNumber = removedShift.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text('Deleted Shift Details'),
      ),
      body: Center(
        child: removedShift.isEmpty
            ?const Text('There are no deleted Shift details!')
            : ListView.builder(
                itemCount: removeShiftNumber,
                itemBuilder: (context, index) {
                  Shift item = removedShift[index];
                  return ListTile(
                  
                    subtitle: Text(
                        'ID: ${item.id} Started Time: ${item.startTime}, End Time: ${item.endTime}'),
                  );
                },
              ),
      ),
    );
  }
}
