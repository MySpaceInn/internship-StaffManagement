import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/service/roster_service.dart';

void main() {
  //runRoster();
  //runStaff();
//runLeave();
runBusiness();
}

void runRoster() {
  RosterService roster = RosterService();
  runApp(roster.getAppMenu());
}

void runBusiness() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text("Business Management"),
          ),
          body: BusinessService().getBusinessHome())));
}

void runAllowance() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text("Allowance Management"),
          ),
          body: AllowanceService().getAllowanceHome())));
}