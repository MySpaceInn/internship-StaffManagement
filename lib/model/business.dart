import 'package:flutter_application_1/model/staff.dart';

class Business {
  int id;
  String registeredDate;
  int tax;
  String ownerName;
  String location;
  String businessName;
  // List<Staff> staffList = [];
  // List<Staff> removedStaffList = [];
  // static int _nextStaffId = 100;

  Business({
    required this.id,
    required this.tax,
    required this.registeredDate,
    required this.ownerName,
    required this.location,
    required this.businessName,
  });

  get businessList => null;

  List<Business>? get removedBusinessList => null;

  // static int getStaffNextId() {
  //   return _nextStaffId++;
  // }

  // void addStaff(Staff staff) {
  //   staffList.add(staff);
  // }

  // void removeStaff(int tax) {
  //   Staff staff = staffList.firstWhere((staff) => staff.tax == tax);
  //   staffList.remove(staff);
  //   removedStaffList.add(staff);
  // }

  // void restoreStaff(Staff staff) {
  //   removedStaffList.remove(staff);
  //   staffList.add(staff);
  // }

  @override
  String toString() {
    return 'Business Name: $businessName, tax: $tax, Location: $location, Registered Date: $registeredDate,Owner Name: $ownerName ,ID: $id';
  }
}
