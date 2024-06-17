
class Leave {
  int id;
  String name;
  String duration;
  String address;
  String type;

  Leave({
    required this.name,
    required this.duration,
    required this.address,
    required this.type,
    required this.id,
  });

  @override
  String toString() {
    return 'Name: $name, duration: $duration, Address: $address, type: $type, ID: $id';
  }
}

    
    
  