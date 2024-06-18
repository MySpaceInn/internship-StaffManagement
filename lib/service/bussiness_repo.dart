import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/model/staff.dart';

class BusinessRepo {
  List<Business> businessList = [];
  List<Business> removedBusinessList = [];
  static int _nextId = 10;
  List<Staff> staffList = [];
  List<Staff> removedStaffList = [];
  static int _nextStaffId = 100;

  static int getNextId() {
    return _nextId++;
  }

  static int getStaffNextId() {
    return _nextStaffId++;
  }

  List<Business> getAllBusiness() {
    return businessList;
  }

  int getAllBusinessNumbers() {
    return businessList.length;
  }

  int getAllRemovedBusinessNumbers() {
    return removedBusinessList.length;
  }

  void add(Business business) {
    businessList.add(business);
  }

  void remove(int id) {
    Business? business = businessList.firstWhere(
      (business) => business.id == id,
    );
    if (business != null) {
      businessList.remove(business);
      removedBusinessList.add(business);
    }
  }

  void restore(Business business) {
    removedBusinessList.remove(business);
    businessList.add(business);
  }

  Business? getBusinessById(int id) {
    return businessList.firstWhere(
      (business) => business.id == id,
    );
  }

  List<Business> getAllRemovedBusiness() {
    return removedBusinessList;
  }

  void addStaff(Staff staff) {
    staffList.add(staff);
  }

  void removeStaff(int id) {
    Staff? staff = staffList.firstWhere(
      (staff) => staff.id == id,
    );
    if (staff != null) {
      staffList.remove(staff);
      removedStaffList.add(staff);
    }
  }

  void restoreStaff(Staff staff) {
    removedStaffList.remove(staff);
    staffList.add(staff);
  }

  List<Staff> getStaffs() {
    return staffList;
  }

  List<Staff> getRemovedStaffs() {
    return removedStaffList;
  }

  bool isIdRegistered(int id) {
    return staffList.any((staff) => staff.id == id);
  }

  void restoreBusiness(Business business) {
    removedBusinessList.remove(business);
    businessList.add(business);
  }

  Business? getRemovedBusinessById(int id) {
    try {
      return removedBusinessList.firstWhere((business) => business.id == id);
    } catch (e) {
      return null;
    }
  }
}
