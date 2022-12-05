import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/repository/icon_selected_repo.dart';

class IconSelectedController extends GetxController{

  final IconSelectedRepo iconSelectedRepo;

  IconSelectedController({required this.iconSelectedRepo});

  final bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  String _iconName = '';
  String get iconName => _iconName;

  ScrollController? _nestedController;
  ScrollController get nestedController => _nestedController!;

  ScrollController? _controller;
  ScrollController get controller => _controller!;

  Future<String> scrollMenuListAfterSelect(String iconName, ScrollController controller, ScrollController nestedController) async{
    return iconSelectedRepo.changeIconTypeRepo(iconName, controller, nestedController);
  }

  String changeIconType(String iconName){
    return iconSelectedRepo.scrollMenuListAfterSelectRepo(iconName);
  }
}