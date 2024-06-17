import 'package:flutter_application_1/model/allowance_model.dart';
import 'package:flutter_application_1/model/leave_model.dart';

class AllowanceRepo {
  List<Allowance> allowanceList = [];
  List<Allowance> removedAllowanceList = [];


   List<Leave> leaveList = [];
  List<Leave> removedLeaveList = [];


  static int _nextId = 10;

  static int getNextAllowanceId() {
    return _nextId++;
  }

  List<Allowance> getAllAllowances() {
    return allowanceList;
  }
  List<Leave>getAllLeaves(){
    return leaveList;
  }

  int getTotalAlowanceNumber() {
    return allowanceList.length;
  }

  void addAllowance(Allowance allowance) {
    allowanceList.add(allowance);
  }

  void removeAllowance(int id) {
    Allowance? allowance = allowanceList.firstWhere(
      (allowance) => allowance.id == id,
    );
    if (allowance != null) {
      allowanceList.remove(allowance);
      removedAllowanceList.add(allowance);
    }
  }

  List<Allowance> getAllRemovedAllowances() {
    return removedAllowanceList;
  }
  List<Leave> getAllRemovedLeaves(){
return removedLeaveList;
  }

  int getTotalDeletedAllowanceNumber() {
    return removedAllowanceList.length;
  }

  void restoreAllowance(Allowance allowance) {
    removedAllowanceList.remove(allowance);
    allowanceList.add(allowance);
  }

  void addLeave(Leave leave) {
    leaveList.add(leave);
  }

  void removeLeave(int id) {
    Leave leave = leaveList.firstWhere((leave) => leave.id == id);
    leaveList.remove(leave);
    removedLeaveList.add(leave);
  }

  void restore(Leave leave) {
    removedLeaveList.remove(leave);
    leaveList.add(leave);
  }
  void updateLeave(Leave updatedLeave) {
  int index = leaveList.indexWhere((leave) => leave.id == updatedLeave.id);
  if (index != -1) {
    leaveList[index] = updatedLeave;
  }
}
void updateAllowannce(Allowance updatedAllowance){
   
      int index = allowanceList
          .indexWhere((allowance) => allowance.id == updatedAllowance.id);
      if (index != -1) {
        allowanceList[index] = updatedAllowance;
      }
}
}
