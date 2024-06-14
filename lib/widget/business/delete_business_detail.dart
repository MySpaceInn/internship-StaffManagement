import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';

class DeleteBusinessDetail extends StatelessWidget {
  final List<Business> businessList;

  DeleteBusinessDetail({required this.businessList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Business Details'),
      ),
      body: Center(
        child: businessList.isEmpty
            ? Text('There are no deleted Business details!')
            : ListView.builder(
                itemCount: businessList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(businessList[index].businessName),
                    subtitle: Text(
                        'ID: ${businessList[index].id} TAX: ${businessList[index].tax}, Location: ${businessList[index].location}, Registered Date: ${businessList[index].registeredDate}, Owner Name: ${businessList[index].ownerName}'),
                  );
                },
              ),
      ),
    );
  }
}
