

class Roster {
  int id;
  String creatorName;
  String createdYear;
  String startDate;
  String endDate;
  

  Roster({
    required this.id, 
  required this.creatorName, 
  required this.createdYear, 
  required this.startDate, 
  required this.endDate}) ;

   get rosters => null;


  List<Roster>? get removeRosters => null;
  
   @override
  String toString() {
    return 'CreatorName: $creatorName, ID: $id, CreatedYear: $createdYear, Started Date: $startDate,Ended Date: $endDate ';
  }

}
