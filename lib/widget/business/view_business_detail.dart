import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/service/staff_service.dart';
import 'package:flutter_application_1/widget/business/active_business.dart';
import 'package:flutter_application_1/widget/business/delete_business_detail.dart';

class ViewBusinessDetail extends StatefulWidget {
  final List<Business> businessList;
  final List<Business> removedBusinessList;

  ViewBusinessDetail({
    super.key,
    required this.businessList,
    required this.removedBusinessList,
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
                    builder: (context) => ActiveBusiness(
                      businessList: widget.businessList,
                    ),
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
                            businessList: widget.removedBusinessList)));
              },
              child: Text("View Deleted Business Details"),
            ),
          ],
        ),
      ),
    );
  }
}
