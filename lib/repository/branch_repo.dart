import 'package:shared_preferences/shared_preferences.dart';

class BranchRepo{
  final SharedPreferences sharedPreferences;
  
  BranchRepo({required this.sharedPreferences});

  setBranchName(String branchName, String branchAddress){
    sharedPreferences.setString('branchName', branchName);
    sharedPreferences.setString('branchAddress', branchAddress);
  }

  getBranchName(){
    return sharedPreferences.getString('branchName');
  }

  getBranchAddress(){
    return sharedPreferences.getString('branchAddress');
  }
}