import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home/tab_bar/second_tab/all_food_types/food_menu.dart';
import 'package:restaurant_app/pages/home/tab_bar/second_tab/menu_icons.dart';
import 'package:restaurant_app/pages/home/tab_bar/second_tab/search_text_field.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class SecondTabBar extends StatelessWidget {

  final ScrollController scrollBarController;
  final ScrollController nestedController;
  final TextEditingController searchController ;
  SecondTabBar({Key? key, required this.scrollBarController, required this.nestedController, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuIcons(controller: scrollBarController, nestedController: nestedController),
        const Divider(
          color: Colors.grey,
        ),
        SizedBox(height: Dimensions.height10/2,),
        SearchTextField(
          textController: searchController,
          hintText: "جستجوی سریع",
          icon: Icons.search_sharp,
          isObscure: false,
        ),
        SizedBox(height: Dimensions.height10/2,),
        const Divider(
          color: Colors.grey,
        ),
        Expanded(child: ComboFoodMenu(controller: scrollBarController,)),
      ],
    );
  }
}