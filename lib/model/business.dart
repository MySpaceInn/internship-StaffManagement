class Business {
  int id;
  String registeredDate;
  int tax;
  String ownerName;
  String location;
  String businessName;

  Business({
    required this.id,
    required this.tax,
    required this.registeredDate,
    required this.ownerName,
    required this.location,
    required this.businessName,
  });

  get businessList => null;

  List<Business>? get removedBusinessList => null;

  @override
  String toString() {
    return 'Business Name: $businessName, tax: $tax, Location: $location, Registered Date: $registeredDate,Owner Name: $ownerName ,ID: $id';
  }
}
