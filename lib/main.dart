import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navigation_bar.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/service/business_service.dart';

void main() {
  runMainPage();
}

void runMainPage() {
  MainPage getMainPage = MainPage();
  runApp(getMainPage.getMainPage());
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
