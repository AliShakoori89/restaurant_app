import 'package:shared_preferences/shared_preferences.dart';

class BranchRepo{
  final SharedPreferences sharedPreferences;
  
  BranchRepo({required this.sharedPreferences});

  setBranchName(String branchName, String branchAddress){
    sharedPreferences.setString('branchName', branchName);
    sharedPreferences.setString('branchAddress', branchAddress);
    print("setBranch setBranch setBranch setBranch setBranch setBranch setBranch setBranch setBranch setBranch");
  }

  getBranchName(){
    print("1111111111111111    "+sharedPreferences.getString('branchName').toString());
    return sharedPreferences.getString('branchName');
  }

  getBranchAddress(){
    return sharedPreferences.getString('branchAddress');
  }
}