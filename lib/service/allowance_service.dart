import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/model/leave_model.dart';
import 'package:flutter_application_1/service/allowance_repo.dart';
import 'package:flutter_application_1/widget/allowance/allowance_menu.dart';

class AllowanceService {
  final AllowanceRepo repo = AllowanceRepo();

  getAllowanceHome() {
    return AllowanceMenu(
      allowanceService: this,
    );
  }

  bool isIdRegistered(int id) {
    return repo.isIdRegistered(id);
  }

  bool isLeaveIdRegistered(int id) {
    return repo.isLeaveIdRegistered(id);
  }

  getAllowance() {
    return repo.getAllAllowances();
  }

  getActiveLeave() {
    return repo.getAllLeaves();
  }

  getActiveLeaves() {
    return repo.getAllLeaves();
  }

  Allowance? getRemovedAllowanceById(int id) {
    return repo.getRemovedAllowanceById(id);
  }

  Leave? getRemovedLeaveById(int id) {
    return repo.getRemovedLeaveById(id);
  }

  getTotalAllowanceNumber() {
    return repo.getTotalAlowanceNumber();
  }

  void createAllowance(Allowance allowance) {
    repo.addAllowance(allowance);
  }

  removeAllowance(int id) {
    repo.removeAllowance(id);
  }

  getRemovedAllowance() {
    return repo.getAllRemovedAllowances();
  }

  getRemovedLeave() {
    return repo.getAllRemovedLeaves();
  }

  getNumberOfRemovedAllowance() {
    return repo.getTotalDeletedAllowanceNumber();
  }

  restoreAllowance(Allowance allowance) {
    repo.restoreAllowance(allowance);
  }

  createLeave(Leave leave) {
    repo.addLeave(leave);
  }

  removeLeave(int id) {
    repo.removeLeave(id);
  }

  void restoreLeave(Leave leave) {
    repo.restore(leave);
  }

  void updateLeaves(Leave leave) {
    repo.updateLeave(leave);
  }

  void updateAllowances(Allowance allowance) {
    repo.updateAllowannce(allowance);
  }
}
