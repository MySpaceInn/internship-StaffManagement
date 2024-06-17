
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/widget/leave/leave_menu.dart';


class ActiveAllowance extends StatelessWidget {
  final AllowanceService allowanceService; 

  ActiveAllowance({
    required this.allowanceService, 
  });

  @override
  Widget build(BuildContext context) {
       List<Allowance>activeAllowances = allowanceService.getAllowance() ;
int activeAllowanceNumber=activeAllowances.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Active Allowance Details'),
      ),
      body: Center(
        child:activeAllowances.isEmpty
            ? Text(' No active allowance details!')
            : ListView.builder(
                itemCount:activeAllowanceNumber,
                itemBuilder: (context, index) {
                  Allowance item=activeAllowances[index];
                  return ListTile(
                    title:
                        Text(item.name),
                    subtitle:
                        Text('''ID: ${item.id},name: ${item.name}
                              address: ${item.address},
                          ammount: ${item.amount},
                           dateIssued: ${item.dateIssued},
                                 type: ${item.type}''',style: TextStyle(fontSize: 15),),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeaveMenu(
                            allowanceService: allowanceService,
                            ),
                          ),
                        );
                      },
                      child: Text("Leave management"),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

