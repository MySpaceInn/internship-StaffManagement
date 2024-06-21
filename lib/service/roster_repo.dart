import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/model/shift.dart';

class RosterRepo {
  List<Roster> rosters = [];
  List<Roster> removeRosters = [];
  static int _nextId = 0;
  static int _nextShiftId = 0;
  List<Shift> shifts = [];
  List<Shift> removedShifts = [];

  static int getNextId() {
    return _nextId++;
  }

  static int getNextShiftId() {
    return _nextShiftId++;
  }

//Roster

  List<Roster> getAllRoster() {
    return rosters;
  }

  List<Roster> getAllDeletedRoster() {
    return removeRosters;
  }

  getremoveRoster() {
    return removeRosters;
  }

  void addRoster(Roster roster) {
    rosters.add(roster);
  }

  void removeRoster(int id) {
    Roster? roster = rosters.firstWhere(
      (roster) => roster.id == id,
    );
    if (roster != null) {
      rosters.remove(roster);
      removeRosters.add(roster);
    }
  }

  void restoreRoster(Roster roster) {
    removeRosters.remove(roster);
    rosters.add(roster);
  }

 

  void updateRoster(Roster updatedRoster) {
    int index = rosters.indexWhere((roster) => roster.id == updatedRoster.id);
    if (index != -1) {
      rosters[index] = updatedRoster;
    }
  }

  bool isIdRegistered(int id) {
    return rosters.any((roster) => roster.id == id);
  }

  Roster? getRosterById(int id) {
    try {
      return removeRosters.firstWhere((roster) => roster.id == id);
    } catch (e) {
      return null;
    }
  }

  

//Shift
  List<Shift> getShift() {
    return shifts;
  }

  List<Shift> getAllDeletedShift() {
    return removedShifts;
  }

  

  void addShift(Shift shift) {
    shifts.add(shift);
  }

  void removeShift(int id) {
    Shift shift = shifts.firstWhere((shift) => shift.id == id);
    shifts.remove(shift);
    removedShifts.add(shift);
  }

  void restoreShift(Shift shift) {
    removedShifts.remove(shift);
    shifts.add(shift);
  }

  void updateShift(Shift updatedShift) {
    int index = shifts.indexWhere((shift) => shift.id == updatedShift.id);
    if (index != -1) {
      shifts[index] = updatedShift;
    }
  }

  bool isShiftIdRegistered(int id) {
    return shifts.any((shift) => shift.id == id);
  }

  Shift? getShiftById(int id) {
    try {
      return removedShifts.firstWhere((shift) => shift.id == id);
    } catch (e) {
      return null;
    }
  }




}
