import 'package:shared_preferences/shared_preferences.dart';

class BranchRepo{
  final SharedPreferences sharedPreferences;
  
  BranchRepo({required this.sharedPreferences});

  setBranchName(String branchName){
    sharedPreferences.setString('branchName', branchName);
  }
  
  getBranchName(){
    return sharedPreferences.getString('branchName');
  }
}