
class Allowance {
  int id;
  String dateIssued;
  String type;
  String name;
  String address;
  String amount;
  
  static int _nextAllowanceId = 100;

  Allowance({
    required this.id,
    required this.type,
    required this.dateIssued,
    required this.name,
    required this.address,
    required this.amount,
  });

  static int getNextId() {
    return _nextAllowanceId++;
  }

  
}
