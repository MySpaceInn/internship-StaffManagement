import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

void main() {
  runHomePage();
}

void runHomePage() {
  GetHomePage homePage = GetHomePage();
  runApp(homePage.getHomeUI());
}
