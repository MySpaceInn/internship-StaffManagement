import 'package:flutter_application_1/model/business.dart';
import 'package:flutter_application_1/model/staff.dart';

import 'package:flutter_application_1/service/bussiness_repo.dart';
import 'package:flutter_application_1/widget/business/business_menu.dart';

class BusinessService {
  final BusinessRepo repo = BusinessRepo();

  getBusinessHome() {
    return BusinessMenu(
      service: this,
    );
  }

  getAllBusinessNumber() {
    return repo.businessList.length;
  }

  getAllRemovedBusinessNumber() {
    return repo.removedBusinessList.length;
  }

  getBusinessDetail() {
    return repo.businessList;
  }

  getAllRemovedBusiness() {
    return repo.removedBusinessList;
  }

  getRestoreBusiness(Business business) {
    return repo.restore(business);
  }

  void add(Business business) {
    repo.add(business);
  }

  void remove(int id) {
    repo.remove(id);
  }

  void restore(Business business) {
    repo.restore(business);
  }

  newBusiness(Business newBusiness) {
    repo.add(newBusiness);
  }

  void addStaff(Staff staff) {
    repo.addStaff(staff);
  }

  void removeStaff(int id) {
    repo.removeStaff(id);
  }

  void restoreStaff(Staff staff) {
    repo.restoreStaff(staff);
  }

  List<Staff> getStaffs() {
    return repo.getStaffs();
  }

  List<Staff> getRemovedStaffs() {
    return repo.getRemovedStaffs();
  }

  int getAllStaffNumber() {
    return repo.staffList.length;
  }

  int getRemovedStaffNumber() {
    return repo.removedStaffList.length;
  }

  bool isIdRegistered(int id) {
    return repo.isIdRegistered(id);
  }

  restoreBusiness(Business business) {
    repo.restoreBusiness(business);
  }

  Business? getRemovedBussinessById(int id) {
    return repo.getRemovedBusinessById(id);
  }
}
