import 'package:flutter_application_1/model/roster.dart';
import 'package:flutter_application_1/widget/roster/roster_menu.dart';

class RosterService {
  List<Roster> rosters = [];
  List<Roster> removeRosters = [];
  static int _nextId =100;

  static int getNextId(){
    return _nextId++;
  }
  
   getRosterHome() {
    return RosterMenu(service: this);
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

  void addRoster(Roster roster) {
    rosters.add(roster);
  }

  void restoreRoster(Roster roster) {
    removeRosters.remove(roster);
    rosters.add(roster);
  }
  

  
}
