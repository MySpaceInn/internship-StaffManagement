// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/service/business_service.dart';
// import 'package:flutter_application_1/service/rostershift_service.dart';

// void main() {
//   runShift();
// }

// void runShift() {
//   runApp(RosterService().getRosterHome());
// }

// void runStaff() {
//   runApp(BusinessService().getAppMenu());
// }





import 'package:flutter/material.dart';
//import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/service/rostershift_service.dart';

void main() {
  runRoster();
}



// void runBusiness() {
//   runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.cyan,
//             title: const Text("Business Management"),
//           ),
//           body: BusinessService().getBusinessHome())));
// }


void runRoster() {
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
            title: const Text("Roster Management"),
          ),
          body: RosterService().getRosterHome())));
}