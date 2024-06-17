import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';

class DeletedAllowance extends StatelessWidget {
  final AllowanceService allowanceService;

  DeletedAllowance({super.key, required this.allowanceService});

  @override
  Widget build(BuildContext context) {
   List<Allowance>removedAllowances = allowanceService.getRemovedAllowance() ;
int removedAllowanceNumber= removedAllowances.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Allowance Details'),
      ),
      body: Center(
      child: removedAllowances.isEmpty
            ? Text(' No any deleted allowance details!')
            : ListView.builder(
                itemCount: removedAllowanceNumber,
                itemBuilder: (context, index) {
                  Allowance item = removedAllowances[index];
                  return ListTile(
                    title:
                        Text(item.name),
                    subtitle:
                        Text('''ID: ${item.id},name: ${item.name}
                              address: ${item.address},
                          ammount: ${item.amount},
                           dateIssued: ${item.dateIssued},
                                 type: ${item.type}''',style: TextStyle(fontSize: 15),),
                  
                  );
                },
              ),
      ),
    );
  }
}
