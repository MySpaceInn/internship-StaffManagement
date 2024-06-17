import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/widget/business/business_menu.dart';
import 'package:flutter_application_1/widget/staff/staff_menu.dart';

class BusinessService {
  List<Business> businessList = [];
  List<Business> removedBusinessList = [];
  static int _nextId = 10;

  static int getNextId() {
    return _nextId++;
  }

  getBusinessHome() {
    return BusinessMenu(
      service: this,
    );
  }

  void removeBusiness(int id) {
    Business? business = businessList.firstWhere(
      (business) => business.id == id,
    );
    if (business != null) {
      businessList.remove(business);
      removedBusinessList.add(business);
    }
  }

  void addBusiness(Business business) {
    businessList.add(business);
  }

  void restoreBusiness(Business business) {
    removedBusinessList.remove(business);
    businessList.add(business);
  }
}
