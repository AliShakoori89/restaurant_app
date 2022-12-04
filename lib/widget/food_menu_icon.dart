// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:restaurant_app/controller/icon_selected_controller.dart';
//
// import 'dimensions.dart';
//
// class FoodMenuIcon extends StatelessWidget {
//
//   final ScrollController controller;
//   final ScrollController nestedController;
//   final String imagePath;
//   final String iconName;
//
//   FoodMenuIcon({Key? key,
//   required this.controller,
//     required this.imagePath,
//     required this.iconName,
//     required this.nestedController}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<IconSelectedController>(builder: (selectController){
//       return GestureDetector(
//         onTap: (){
//           print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//           selectController.iconSelectedRepo.changeIconType(iconName, controller, nestedController, imagePath);
//         },
//         child: Column(
//           children: [
//             Image.asset("assets/images/$imagePath",
//                 width: Dimensions.width45),
//             Text(iconName, style: TextStyle(color: Colors.grey[900]))
//           ],
//         ),
//       );
//     }
//     );
//   }
// }
