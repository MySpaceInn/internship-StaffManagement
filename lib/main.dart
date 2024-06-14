import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navigation_bar.dart';
import 'package:flutter_application_1/service/allowance_service.dart';

void main() {
  //runRoster();
  //runStaff();
  ///runAllowance();
  runMainPage();
}

void runMainPage() {
  MainPage getMainPage = MainPage();
  runApp(getMainPage.getMainPage());
}

void runAllowance() {
  AllowanceService allowance = AllowanceService();

  runApp(allowance.getAppMenu());
}
