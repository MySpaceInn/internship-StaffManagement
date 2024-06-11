class Staff {
  int id;
  String name;
  int tax;
  String address;
  int age;

  Staff({
    required this.name,
    required this.tax,
    required this.address,
    required this.age,
    required this.id,
  });

  @override
  String toString() {
    return 'Name: $name, tax: $tax, Address: $address, Age: $age, ID: $id';
  }
}
