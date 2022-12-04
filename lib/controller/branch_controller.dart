import 'package:get/get.dart';
import 'package:restaurant_app/repository/branch_repo.dart';

class BranchController extends GetxController{

  final BranchRepo branchRepo;

  BranchController({required this.branchRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  String _name = '';
  String get name => _name;

  String _address = '';
  String get address => _address;

  setBranch(String branchName, String branchAddress) async{
    _name = await branchRepo.setBranchName(branchName, branchAddress);
    // _isLoaded = true;
    update();
  }

  Future<String> getBranchName() async{

    _name = await branchRepo.getBranchName();
    // _isLoaded = true;
    update();
    return _name;
  }

  Future<String> getBranchAddress() async{

    _address = await branchRepo.getBranchAddress();
    // _isLoaded = true;
    update();
    return _address;
  }
}