import 'package:flutter/material.dart';
import 'package:restaurant_app/routes/route_helper.dart';
import 'package:restaurant_app/widget/dimensions.dart';
import 'package:get/get.dart';

class GoToInitialPageIcon extends StatelessWidget {
  const GoToInitialPageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
          onPressed: (){
            Get.offNamed(RouteHelper.getInitial());
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: Dimensions.width30,)),
    );
  }
}
