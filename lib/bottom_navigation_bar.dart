import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/service/roster_service.dart';

class MainPage {
  getMainPage() {
    return const MaterialApp(
        home: Scaffold(body: BottomNavigationBarExample()));
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    GetHomePage().getHomeUI(),
    BusinessService().getBusinessHome(),
    RosterService().getAppMenu(),
    AllowanceService().getAllowanceHome(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Business',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Color.fromARGB(255, 212, 81, 72),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Roster',
            backgroundColor: Color.fromARGB(255, 76, 170, 175),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Allowance',
            backgroundColor: Color.fromARGB(255, 69, 176, 39),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}
