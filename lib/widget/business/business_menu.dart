import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/service/staff_service.dart';
import 'package:flutter_application_1/widget/business/create_business.dart';
import 'package:flutter_application_1/widget/business/remove_business.dart';
import 'package:flutter_application_1/widget/business/restore_business.dart';
import 'package:flutter_application_1/widget/business/update_business.dart';
import 'package:flutter_application_1/widget/business/view_business_detail.dart';

class BusinessMenu extends StatefulWidget {
  final BusinessService service;

  BusinessMenu({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  _BusinessMenuState createState() => _BusinessMenuState();
}

class _BusinessMenuState extends State<BusinessMenu> {
  List<Business> businessList = [];
  List<Business> removedBusinessList = [];

  @override
  void initState() {
    super.initState();
    businessList = widget.service.businessList;
    removedBusinessList = widget.service.removedBusinessList;
  }

  void addBusiness(Business business) {
    setState(() {
      businessList.add(business);
      widget.service.businessList = businessList;
    });
  }

  void removeBusiness(int id) {
    setState(() {
      Business? business = businessList.firstWhere(
        (business) => business.id == id,
      );
      if (business != null) {
        businessList.remove(business);
        removedBusinessList.add(business);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Business Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateBusiness(
                      BusinessList: widget.service.businessList,
                      addBusiness: addBusiness,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Create Business",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateBusiness(
                      businessList: widget.service.businessList,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Update Business",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteBusiness(
                      businessList: widget.service.businessList,
                      removeBusiness: removeBusiness,
                      removedBusinessList: widget.service.removedBusinessList,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Remove Business",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestoreBusiness(
                      removedBusinessList: widget.service.removedBusinessList,
                      businessList: widget.service.businessList,
                      restoreBusiness: (Business business) {
                        setState(() {
                          widget.service.removedBusinessList.remove(business);
                          widget.service.businessList.add(business);
                        });
                      },
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Restore Account",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewBusinessDetail(
                      businessList: widget.service.businessList,
                      removedBusinessList: widget.service.removedBusinessList,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "View Business Details",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
