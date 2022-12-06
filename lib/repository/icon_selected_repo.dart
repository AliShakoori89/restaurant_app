import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class IconSelectedRepo{

  changeIconTypeRepo(String iconName, ScrollController controller, ScrollController nestedController){
    if(iconName == "کمبو"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(0);
    }
    else if(iconName == "پیتزا"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*45);
    }

    else if(iconName == "هات داگ"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*136);
    }

    else if(iconName == "برگر"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*164);
    }

    else if(iconName == "ساندویچ گرم"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*226);
    }

    else if(iconName == "سوخاری"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*246);
    }

    else if(iconName == "پوتین"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*283);
    }

    else if(iconName == "پیش غذا"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*302);
    }

    else if(iconName == "نوشیدنی"){
      nestedController.jumpTo(Dimensions.height45*7.2);
      controller.jumpTo(Dimensions.height45*338);
    }
  }
}