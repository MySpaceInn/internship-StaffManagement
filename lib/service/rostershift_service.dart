import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/model/shift.dart';
import 'package:flutter_application_1/service/roster_repo.dart';
import 'package:flutter_application_1/widget/roster/roster_menu.dart';

class RosterService {
  final RosterRepo rosterRepo = RosterRepo();
  getRosterHome() {
    return RosterMenu(service: this);
  }

  //Roster
  void addRoster(Roster roster) {
    rosterRepo.addRoster(roster);
  }

  getRemoveRoster(int id) {
    rosterRepo.removeRoster(id);
  }

  getAllRomovedRoster() {
    return rosterRepo.getremoveRoster();
  }

  void restoreRoster(Roster roster) {
    rosterRepo.restoreRoster(roster);
  }

  List<Roster> getRoster() {
    return rosterRepo.getAllRoster();
  }

  void updatedRoster(Roster roster) {
    rosterRepo.updateRoster(roster);
  }

   bool isIdRegistered(int id) {
    return rosterRepo.isIdRegistered(id);
  }

  bool isShiftIdRegistered(int id) {
    return rosterRepo.isShiftIdRegistered(id);
  }

//Shift


  getAllShift() {
    return rosterRepo.getShift();
  }
  getRemovedShift(){
    return rosterRepo.getAllDeletedShift();
  }

  void addShiftList(Shift shift) {
    rosterRepo.addShift(shift);
  }

  void removeShift(int id) {
    rosterRepo.removeShift(id);
  }

  void restoreShift(Shift shift) {
    rosterRepo.restoreShift(shift);
  }

  void updatedShift(Shift shift) {
    rosterRepo.updateShift(shift);
  }

Roster? getRemovedRosterById(int id) {
    return rosterRepo.getRosterById(id);
  }

  Shift? getRemovedShiftById(int id) {
    return rosterRepo.getShiftById(id);
  }

}
