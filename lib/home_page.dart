import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/service/roster_service.dart';

void runRoster() {
  RosterService roster = RosterService();
  runApp(roster.getAppMenu());
}

void runStaff() {
  runApp(BusinessService().getAppMenu());
}

class GetHomePage {
  getHomeUI() {
    return const MaterialApp(
        title: 'Staff Management',
        home: Scaffold(
          // appBar: AppBar(
          //   title: const Text("Welcome To HomePage"),
          //   //  leading: Builder(
          //   //    builder: (context) {
          //   // //     return IconButton(
          //   // //         icon: const Icon(Icons.menu),
          //   // //         onPressed: () {
          //   // //           Scaffold.of(context).openDrawer();
          //   // //         });
          //   //   },
          //   // )
          // ),
          body: HomePage(),
          // drawer: Drawer(
          //     backgroundColor: Color.fromARGB(59, 255, 255, 255),
          //     child: ListView(padding: EdgeInsets.zero, children: const [
          //       DrawerHeader(
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 77, 2, 142),
          //         ),
          //         child: Text('Our Services'),
          //       ),
          //       ListTile(
          //         title: Text('Business'),
          //         // onTap:
          //       )
          //     ]))
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
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
    BusinessService().getAppMenu(),
    Text('Roster'),
    AllowanceService().getAppMenu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to HomePage'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Roster',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Allowance',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
