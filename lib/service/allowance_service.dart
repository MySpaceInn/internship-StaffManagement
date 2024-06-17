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
  

  getAllowance() {
    return repo.getAllAllowances();
  }
  getActiveLeaves(){
    return repo.getAllLeaves();
  }

  getTotalAllowanceNumber() {
    return repo.getTotalAlowanceNumber();
  }

  void addAllowance(Allowance allowance) {
    repo.addAllowance(allowance);
  }

  void removeAllowance(int id) {
    repo.removeAllowance(id);
  }

  getRemovedAllowance() {
    return repo.getAllRemovedAllowances();
  }
  getRemovedLeave(){
    return repo.getAllRemovedLeaves();
  }

  getNumberOfRemovedAllowance() {
    return repo.getTotalDeletedAllowanceNumber();
  }

  void restoreAllowance(Allowance allowance) {
    repo.restoreAllowance(allowance);
  }

  void createLeave(Leave leave) {
    repo.addLeave(leave);
  }

  void removeLeave(int id) {
    repo.removeLeave(id);
  }

  void restoreLeave(Leave leave) {
    repo.restore(leave);
  }
  void updateLeaves(Leave leave) {
  repo.updateLeave(leave);
}
void updateAllowances(Allowance allowance){
  repo.updateAllowannce(allowance);
}

}
