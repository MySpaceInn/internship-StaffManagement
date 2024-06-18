import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';

class DeletedAllowance extends StatelessWidget {
  final List<Allowance> removedAllowances;

  DeletedAllowance({required this.removedAllowances});

  @override
  Widget build(BuildContext context) {
    int removedAllowanceNumber = removedAllowances.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text('Deleted Allowance Details'),
      ),
      body: Center(
        child: removedAllowances.isEmpty
            ?const Text('No any deleted allowance details!')
            : ListView.builder(
                itemCount: removedAllowanceNumber,
                itemBuilder: (context, index) {
                  Allowance item = removedAllowances[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                      '''ID: ${item.id}, Name: ${item.name}
                         Address: ${item.address},
                         Amount: ${item.amount},
                         Date Issued: ${item.dateIssued},
                         Type: ${item.type}''',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
