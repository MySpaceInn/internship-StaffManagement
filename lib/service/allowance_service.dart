import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/leave/allowance_menu.dart';



class AllowanceService {
  Map<String, String> leaves = {};
  List<Map<String, String>> deletedLeaves = [];
  AllowanceService();

  getAppMenu() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AllowanceMenu(service: this),
    );
  }

  int displayMenuAndGetChoice() {
    print("1. Create the leaves");
    print("2. Update the leaves");
    print("3. Remove the leaves");
    print("4. Restore the leave");
    print("5. View leave details");

    int choice = int.parse(stdin.readLineSync()!);
    return choice;
  }

  String getParameterFromUser({required String question}) {
    print("Enter the $question");
    String val = stdin.readLineSync()!;
    return val;
  }

  void createLeave() {
    String name = getParameterFromUser(question: "name of staff");
    String duration = getParameterFromUser(question: "Duration");

    print("Select the type of leaves");
    print("1. Annual leave");
    print("2. Sick leaves");
    int typeChoice = int.parse(stdin.readLineSync()!);
    String leaveType;

    if (typeChoice == 1) {
      print("Select the type of annual leaves");
      print("1. Paid annual leave");
      print("2. Unpaid annual leaves");

      int annualTypeChoice = int.parse(stdin.readLineSync()!);
      if (annualTypeChoice == 1) {
        leaveType = "Paid Annual Leave";
      } else if (annualTypeChoice == 2) {
        leaveType = "Unpaid Annual leave";
      } else {
        print("Invalid choice.");
        return;
      }
    } else if (typeChoice == 2) {
      leaveType = "Sick Leave";
    } else {
      print("Invalid choice.");
      return;
    }

    leaves[name] = "Duration: $duration, Type: $leaveType";
    print(
        "Leave has been created for $name with duration of $duration as $leaveType.");
  }

  void updateLeave() {
    String name =
        getParameterFromUser(question: "name of staff you want to update");

    if (leaves.containsKey(name)) {
      print("Enter the updated duration of the leave");
      String updatedDuration = stdin.readLineSync()!;
      print("Enter the updated type of leave");
      print("Select the type of leave:");
      print("1. Annual leave");
      print("2. Sick leave");
      int typeChoice = int.parse(stdin.readLineSync()!);
      String updatedType;

      if (typeChoice == 1) {
        print("Select the type of annual leave:");
        print("1. Paid annual leave");
        print("2. Unpaid annual leave");

        int annualTypeChoice = int.parse(stdin.readLineSync()!);
        if (annualTypeChoice == 1) {
          updatedType = "Paid Annual Leave";
        } else if (annualTypeChoice == 2) {
          updatedType = "Unpaid Annual leave";
        } else {
          print("Invalid choice.");
          return;
        }
      } else if (typeChoice == 2) {
        updatedType = "Sick Leave";
      } else {
        print("Invalid choice.");
        return;
      }

      leaves[name] = "Duration: $updatedDuration, Type: $updatedType";
      print("Leave details for $name have been updated.");
    } else {
      print("No leave found for $name");
    }
  }

  void removeLeave() {
    String name =
        getParameterFromUser(question: "name of staff to remove leave");

    if (leaves.containsKey(name)) {
      deletedLeaves.add({name: leaves[name]!});
      leaves.remove(name);
      print("Leave for $name has been removed.");
    } else {
      print("No leave found for $name.");
    }
  }

  void restoreLeave() {
    String name =
        getParameterFromUser(question: "name of staff to restore the leave");
    bool found = false;

    for (var i = 0; i < deletedLeaves.length; i++) {
      if (deletedLeaves[i].containsKey(name)) {
        leaves[name] = deletedLeaves[i][name]!;
        deletedLeaves.removeAt(i);
        found = true;
        print("Leave for $name has been restored.");
        break;
      }
    }

    if (!found) {
      print("No leave found for $name to restore.");
    }
  }

  void displayLeaveDetails() {
    print("Select the type of details");
    print("1. Active details");
    print("2. Deleted details");
    int viewType = int.parse(stdin.readLineSync()!);

    if (viewType == 1) {
      if (leaves.isEmpty) {
        print("No active leaves are currently stored.");
      } else {
        print("Active Leave Details:");
        leaves.forEach((name, details) {
          print("Leave: $name, $details");
        });
      }
    } else if (viewType == 2) {
      if (deletedLeaves.isEmpty) {
        print("No deleted leaves are currently stored.");
      } else {
        print("Deleted Leave Details:");
        for (var leave in deletedLeaves) {
          leave.forEach((name, details) {
            print("Leave: $name, $details");
          });
        }
      }
    } else {
      print("Invalid choice.");
    }
  }

  void startProgram() {
    while (true) {
      int choice = displayMenuAndGetChoice();
      switch (choice) {
        case 1:
          createLeave();
          break;
        case 2:
          updateLeave();
          break;
        case 3:
          removeLeave();
          break;
        case 4:
          restoreLeave();
          break;
        case 5:
          displayLeaveDetails();
          break;
        default:
          print("Invalid choice. Please try again.");
      }
    }
  }
}