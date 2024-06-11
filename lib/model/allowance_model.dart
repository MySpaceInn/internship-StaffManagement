class Allowance {
  String name;
  String tax;
  int id;
  String address;
  int age;

  Allowance({
    required this.name,
    required this.tax,
    required this.id,
    required this.address,
    required this.age,
  });
  String toString() {
    return 'Name: $name, Pan: $tax, Address: $address, Age: $age, id: $id';
  }

 
}