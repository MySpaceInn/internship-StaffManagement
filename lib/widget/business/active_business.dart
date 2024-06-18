import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/widget/staff/staff_menu.dart';

import '../../model/business.dart';

class ActiveBusiness extends StatelessWidget {
  final List<Business> activeBusiness;

  ActiveBusiness({
    required this.activeBusiness,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Business Details'),
      ),
      body: Center(
        child: activeBusiness.isEmpty
            ? Text('There are no active business details!')
            : ListView.builder(
                itemCount: activeBusiness.length,
                itemBuilder: (context, index) {
                  Business item = activeBusiness[index];
                  return ListTile(
                    title: Text(item.businessName),
                    subtitle: Text('''ID: ${item.id},
                         TAX Number: ${item.tax},
                          Location: ${item.location},
                           Registered Date: ${item.registeredDate},
                            Owner Name: ${item.ownerName}'''),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StaffMenu(
                              businessService: BusinessService(),
                            ),
                          ),
                        );
                      },
                      child: Text("Staff management"),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
