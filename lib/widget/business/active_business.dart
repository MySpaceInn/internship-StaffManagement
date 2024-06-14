import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/service/staff_service.dart';

class ActiveBusiness extends StatelessWidget {
  final List<Business> businessList;

  ActiveBusiness({
    required this.businessList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Business Details'),
      ),
      body: Center(
        child: businessList.isEmpty
            ? Text('There are no active business details!')
            : ListView.builder(
                itemCount: businessList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(businessList[index].businessName),
                    subtitle: Text(
                        'ID: ${businessList[index].id}, TAX Number: ${businessList[index].tax}, Location: ${businessList[index].location}, Registered Date: ${businessList[index].registeredDate}, Owner Name: ${businessList[index].ownerName}'),
                    trailing: ElevatedButton(
                        onPressed: () {
                          StaffService();
                        },
                        child: Text("Staff management")),
                  );
                },
              ),
      ),
    );
  }
}
