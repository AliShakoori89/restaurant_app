import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class SearchTextField extends StatelessWidget {

  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;

  SearchTextField({Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45,
      margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
      ),
      child: TextField(
        obscureText: isObscure?true:false,
        controller: textController,
        textAlign: TextAlign.end,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
            ),
            suffixIcon: Icon(icon, color: Colors.grey,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey
                )
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2)
            )
        ),
      ),
    );
  }
}
