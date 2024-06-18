import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/business_service.dart';

import '../../model/business.dart';

class DeleteBusinessDetail extends StatelessWidget {
  final List<Business> deleteBusiness;

  DeleteBusinessDetail({required this.deleteBusiness});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Business Details'),
      ),
      body: Center(
        child: deleteBusiness.isEmpty
            ? Text('There are no active business details!')
            : ListView.builder(
                itemCount: deleteBusiness.length,
                itemBuilder: (context, index) {
                  Business item = deleteBusiness[index];
                  return ListTile(
                    title: Text(item.businessName),
                    subtitle: Text('''ID: ${item.id},
                         TAX Number: ${item.tax},
                          Location: ${item.location},
                           Registered Date: ${item.registeredDate},
                            Owner Name: ${item.ownerName}'''),
                  );
                },
              ),
      ),
    );
  }
}
