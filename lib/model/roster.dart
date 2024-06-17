
import 'package:flutter_application_1/model/shift.dart';

class Roster {
  int id;
  String creatorName;
  String createdYear;
  String startDate;
  String endDate;
  List<Shift> shifts =[];
  List<Shift> removeshifts =[];
  static int _nextShiftId =100;
  

  Roster({
    required this.id, 
  required this.creatorName, 
  required this.createdYear, 
  required this.startDate, 
  required this.endDate}) ;

  get rosters => null;


  List<Roster>? get removeRosters => null;
  
  static int getShiftId  (){
    return _nextShiftId;
  }

   void addShift(Shift shift) {
    shifts.add(shift);
  }

  void removeShift(int id) {
    Shift shift = shifts.firstWhere((shift) => shift.id == id);
    shifts.remove(shift);
    removeshifts.add(shift);
  }

  void restoreShift(Shift shift) {
    removeshifts.remove(shift);
    shifts.add(shift);
  }
    
   @override
  String toString() {
    return 'CreatorName: $creatorName, ID: $id, CreatedYear: $createdYear, Started Date: $startDate,Ended Date: $endDate ';
  }

}
