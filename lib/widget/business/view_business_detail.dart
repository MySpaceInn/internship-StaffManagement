import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/widget/business/active_business.dart';
import 'package:flutter_application_1/widget/business/delete_business_detail.dart';

class ViewBusinessDetail extends StatefulWidget {
  final BusinessService businessService;

  ViewBusinessDetail({
    super.key,
    required this.businessService,
  });

  @override
  State<ViewBusinessDetail> createState() => _ViewBusinessDetailState();
}

class _ViewBusinessDetailState extends State<ViewBusinessDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Business Details"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ActiveBusiness(businessService: widget.businessService),
                  ),
                );
              },
              child: Text("View Active Business Details"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeleteBusinessDetail(
                            businessList:
                                widget.businessService.removedBusinessList)));
              },
              child: Text("View Deleted Business Details"),
            ),
          ],
        ),
      ),
    );
  }
}
