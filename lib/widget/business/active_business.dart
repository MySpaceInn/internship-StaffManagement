import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/widget/staff/staff_menu.dart';

class ActiveBusiness extends StatelessWidget {
  final BusinessService businessService; // Add StaffService as a parameter

  ActiveBusiness({
    required this.businessService, // Initialize the StaffService
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Business Details'),
      ),
      body: Center(
        child: businessService.businessList.isEmpty
            ? Text('There are no active business details!')
            : ListView.builder(
                itemCount: businessService.businessList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text(businessService.businessList[index].businessName),
                    subtitle:
                        Text('''ID: ${businessService.businessList[index].id},
                         TAX Number: ${businessService.businessList[index].tax},
                          Location: ${businessService.businessList[index].location},
                           Registered Date: ${businessService.businessList[index].registeredDate},
                            Owner Name: ${businessService.businessList[index].ownerName}'''),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StaffMenu(
                              business: businessService.businessList[index],
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
