import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/staff.dart';
import 'package:flutter_application_1/widget/staff/staff_menu.dart';

class BusinessService {
  List<Staff> staffList = [];
  List<Staff> removedStaffList = [];
  static int _nextId = 100;

  static int getNextId() {
    return _nextId++;
  }

  getAppMenu() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StaffMenu(
        service: this,
      ),
    );
  }
}

void main() {
  BusinessService service = BusinessService();
  runApp(service.getAppMenu());
}
