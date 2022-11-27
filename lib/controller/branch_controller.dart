import 'package:get/get.dart';
import 'package:restaurant_app/repository/branch_repo.dart';

class BranchController extends GetxController{

  final BranchRepo branchRepo;

  BranchController({required this.branchRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  String _name = '';
  String get name => _name;

  setBranchName(String branchName) async{
    _name = await branchRepo.setBranchName(branchName);
    _isLoaded = true;
    update();
  }

  Future<String> getBranchName() async{

    _name = await branchRepo.getBranchName();
    // _isLoaded = true;
    update();
    return _name;
  }
}