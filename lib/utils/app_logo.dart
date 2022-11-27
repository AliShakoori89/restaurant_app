import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/dimensions.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/logo.png",
      height: Dimensions.height30*8,);
  }
}
