// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/create.dart';
// import 'package:flutter_application_1/delete.dart';
// import 'package:flutter_application_1/listShift.dart';
// import 'package:flutter_application_1/restore.dart';
// import 'package:flutter_application_1/update.dart';

// class Shift {
//   String name;
//   String date;
//   String time;
//   bool isDeleted;

//   Shift(this.name, this.date, this.time) : isDeleted = false;
// }

// class Roster extends ChangeNotifier {
//   List<Shift> shifts = [];
//   ValueNotifier<List<Shift>> shiftsNotifier = ValueNotifier([]);

//   getAppMenu() {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true),
//       home: Rostermenu(service: this),
//     );
//   }

//   void menu() {
//     bool exit = false;
//     while (!exit) {
//       print("\nRooster Shift Manager");
//       print("1. Create Shift");
//       print("2. List Shifts");
//       print("3. Update Shift");
//       print("4. Delete Shift");
//       print("5. Restore Shift");
//       print("6. Exit");

//       stdout.write("Enter your choice: ");
//       String choice = stdin.readLineSync() ?? "";

//       switch (choice) {
//         case "1":
//           createShift();
//           break;
//         case "2":
//           listShifts();
//           break;
//         case "3":
//           updateShift();
//           break;
//         case "4":
//           deleteShift();
//           break;
//         case "5":
//           restoreShift();
//           break;
//         case "6":
//           exit = true;
//           break;
//         default:
//           print("Invalid choice. Please try again.");
//       }
//     }
//   }

//   void createShift() {
//     stdout.write("Enter name: ");
//     String name = stdin.readLineSync() ?? "";
//     stdout.write("Enter date (YYYY-MM-DD): ");
//     String date = stdin.readLineSync() ?? "";
//     stdout.write("Enter time (HH:MM): ");
//     String time = stdin.readLineSync() ?? "";
//     shifts.add(Shift(name, date, time));
//     print("Shift created successfully!");
//   }

//   void createShiftWithParameters(String name, String date, String time) {
//     shifts.add(Shift(name, date, time));
//     print("Shift created successfully!");
//   }

//   void listShifts() {
//     if (shifts.isEmpty) {
//       print("No shifts available.");
//       return;
//     }

//     bool exit = false;
//     while (!exit) {
//       print("\nList Shifts");
//       print("1. Current Shifts");
//       print("2. Deleted Shifts");
//       print("3. Back to Main Menu");

//       stdout.write("Enter your choice: ");
//       String choice = stdin.readLineSync() ?? "";

//       switch (choice) {
//         case "1":
//           listCurrentShifts();
//           break;
//         case "2":
//           listDeletedShifts();
//           break;
//         case "3":
//           exit = true;
//           break;
//         default:
//           print("Invalid choice. Please try again.");
//       }
//     }
//   }

//   void listCurrentShifts() {
//     bool hasCurrentShifts = false;
//     print("Current Shifts:");
//     for (int i = 0; i < shifts.length; i++) {
//       if (!shifts[i].isDeleted) {
//         print(
//             "${i + 1}. ${shifts[i].name} - ${shifts[i].date} at ${shifts[i].time}");
//         hasCurrentShifts = true;
//       }
//     }
//     if (!hasCurrentShifts) {
//       print("No current shifts available.");
//     }
//   }

//   void listDeletedShifts() {
//     bool hasDeletedShifts = false;
//     print("Deleted Shifts:");
//     for (int i = 0; i < shifts.length; i++) {
//       if (shifts[i].isDeleted) {
//         print(
//             "${i + 1}. ${shifts[i].name} - ${shifts[i].date} at ${shifts[i].time}");
//         hasDeletedShifts = true;
//       }
//     }
//     if (!hasDeletedShifts) {
//       print("No deleted shifts.");
//     }
//   }

//   void updateShift() {
//     listCurrentShifts();
//     stdout.write("Enter the number of the shift to update: ");
//     int index = int.parse(stdin.readLineSync() ?? "0") - 1;

//     if (index < 0 || index >= shifts.length || shifts[index].isDeleted) {
//       print("Invalid shift number.");
//       return;
//     }

//     stdout.write("Enter new name (press Enter to keep current): ");
//     String name = stdin.readLineSync() ?? "";
//     if (name.isNotEmpty) shifts[index].name = name;

//     stdout.write("Enter new date (press Enter to keep current): ");
//     String date = stdin.readLineSync() ?? "";
//     if (date.isNotEmpty) shifts[index].date = date;

//     stdout.write("Enter new time (press Enter to keep current): ");
//     String time = stdin.readLineSync() ?? "";
//     if (time.isNotEmpty) shifts[index].time = time;

//     print("Shift updated successfully!");
//   }

//   void deleteShift() {
//     listCurrentShifts();
//     stdout.write("Enter the number of the shift to delete: ");
//     int index = int.parse(stdin.readLineSync() ?? "0") - 1;
//     notifyListeners();
//     if (index < 0 || index >= shifts.length || shifts[index].isDeleted) {
//       print("Invalid shift number.");
//       return;
//     }

//     shifts[index].isDeleted = true;
//     print("Shift deleted successfully!");
//   }

//   void restoreShift() {
//     listDeletedShifts();
//     stdout.write("Enter the number of the shift to restore: ");
//     int index = int.parse(stdin.readLineSync() ?? "0") - 1;

//     if (index < 0 || index >= shifts.length || !shifts[index].isDeleted) {
//       print("Invalid shift number.");
//       return;
//     }

//     shifts[index].isDeleted = false;
//     print("Shift restored successfully!");
//   }

//   void restoreShiftById(int index) {
//     if (index >= 0 && index < shifts.length && shifts[index].isDeleted) {
//       shifts[index].isDeleted = false;
//       notifyListeners();
//     }
//   }
// }

// class Rostermenu extends StatelessWidget {
//   const Rostermenu({super.key, required this.service});
//   final Roster service;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         title: Text("Roster Management"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Colors.cyanAccent,
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   textStyle: TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Create(service: service)));
//                 },
//                 child: Text("1. Create Shift")),
//             SizedBox(height: 10),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Colors.cyanAccent,
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   textStyle: TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ListShift(Service: service)));
//                 },
//                 child: Text("2. List Shift")),
//             SizedBox(height: 10),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Colors.cyanAccent,
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   textStyle: TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Update(
//                                 service: service,
//                               )));
//                 },
//                 child: Text("3. Update Shift")),
//             SizedBox(height: 10),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Colors.cyanAccent,
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   textStyle: TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => delete(service: service)));
//                 },
//                 child: Text("4. Delete Shift")),
//             SizedBox(height: 10),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Colors.cyanAccent,
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   textStyle: TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Restore(
//                                 service: service,
//                               )));
//                 },
//                 child: Text("5. Restore Shift")),
//             SizedBox(height: 10),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Colors.cyan,
//                   shadowColor: Colors.black,
//                   elevation: 5,
//                   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                   textStyle: TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {
//                   SystemNavigator.pop();
//                 },
//                 child: Text("6. Exit")),
//           ],
//         ),
//       ),
//     );
//   }
// }
