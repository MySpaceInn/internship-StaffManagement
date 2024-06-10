import 'dart:io';

class Employee {
  int id;
  String name;

  Employee(this.id, this.name);

  @override
  String toString() => 'Employee(id: $id, name: $name)';
}

class Shift {
  int id;
  DateTime date;
  Employee employee;

  Shift(this.id, this.date, this.employee);

  @override
  String toString() => 'Shift(id: $id, date: $date, employee: $employee)';
}

class RosterManager {
  final List<Shift> _shifts = [];

  void performOperation(String operation) {
    switch (operation) {
      case 'create':
        _createShift();
        break;
      case 'read':
        _readShifts();
        break;
      case 'update':
        _updateShift();
        break;
      case 'delete':
        _deleteShift();
        break;
      default:
        print('Invalid operation');
    }
  }

  void _createShift() {
    print('Enter date (yyyy-mm-dd):');
    final dateString = stdin.readLineSync();
    final date = DateTime.parse(dateString!);

    print('Enter employee id:');
    final employeeId = int.parse(stdin.readLineSync()!);
    final employee = Employee(employeeId, 'Employee $employeeId');

    final id = _shifts.length + 1;
    final shift = Shift(id, date, employee);
    _shifts.add(shift);
    print('Shift created: $shift');
  }

  void _readShifts() {
    print('All shifts:');
    for (var i = 0; i < _shifts.length; i++) {
      print('${i + 1}. ${_shifts[i]}');
    }
  }

  void _updateShift() {
    _readShifts();
    print('Enter shift number to update:');
    final shiftNumber = int.parse(stdin.readLineSync()!);

    if (shiftNumber < 1 || shiftNumber > _shifts.length) {
      print('Invalid shift number');
      return;
    }

    final shiftIndex = shiftNumber - 1;
    final shift = _shifts[shiftIndex];

    print('Enter new date (yyyy-mm-dd):');
    final newDateString = stdin.readLineSync();
    final newDate = DateTime.parse(newDateString!);

    shift.date = newDate;
    print('Shift updated: $shift');
  }

  void _deleteShift() {
    _readShifts();
    print('Enter shift number to delete:');
    final shiftNumber = int.parse(stdin.readLineSync()!);

    if (shiftNumber < 1 || shiftNumber > _shifts.length) {
      print('Invalid shift number');
      return;
    }

    final shiftIndex = shiftNumber - 1;
    final shift = _shifts.removeAt(shiftIndex);
    print('Shift deleted: $shift');
  }
}

void main() {
  final rosterManager = RosterManager();

  while (true) {
    print('Enter operation (create/read/update/delete):');
    final operation = stdin.readLineSync()!;

    if (operation == 'exit') {
      break;
    }

    rosterManager.performOperation(operation);
  }
}