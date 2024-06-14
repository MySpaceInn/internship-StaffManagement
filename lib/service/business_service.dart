import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/widget/business/business_menu.dart';

class BusinessService {
  List<Business> businessList = [];
  List<Business> removedBusinessList = [];
  static int _nextId = 10;

  BusinessService();

  static int getNextId() {
    return _nextId++;
  }

  getAppMenu() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BusinessMenu(
        service: this,
      ),
    );
  }
}
