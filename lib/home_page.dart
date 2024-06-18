import 'package:flutter/material.dart';

import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/service/roster_service.dart';

void runRoster() {
  RosterService roster = RosterService();
  runApp(roster.getAppMenu());
}

void runStaff() {
  runApp(BusinessService().getBusinessHome());
}

List<String> demoList = <String>[];

class GetHomePage {
  getHomeUI() {
    return MaterialApp(
        title: 'Staff Management',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text('Home Page'),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          const Text('Recently Added Leaves:'),
          Expanded(
            child: ListView.builder(
              itemCount: demoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(demoList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
