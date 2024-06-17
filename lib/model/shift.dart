
class Shift {
  int id;
  String startTime;
  String endTime;


  Shift({
  required this.id,
  required this.startTime, 
  required this.endTime}) ;

  @override
  String toString(){
  return 'ID :$id  , Date: $startTime ,Time : $endTime' ;
}

}
