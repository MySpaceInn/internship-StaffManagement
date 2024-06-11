import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/service/roster_service.dart';

void main() {
  runStaff();
}

void runRoster() {
  RosterService roster = RosterService();
  runApp(roster.getAppMenu());
}

void runStaff() {
  runApp(BusinessService().getAppMenu());
}
