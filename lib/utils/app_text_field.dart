import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/widgets.dart';

class AppTextField extends StatefulWidget {

  final String labelText;
  final IconData icon;
  final String error;
  final TextEditingController controller;
  bool? isObscure;

  AppTextField({Key? key,
    required this.labelText,
    required this.icon,
    required this.error,
    required this.controller,
    this.isObscure}) : super(key: key);

  @override
  State<AppTextField> createState() =>
      _AppTextFieldState(labelText, icon, error, controller, isObscure);
}

class _AppTextFieldState extends State<AppTextField> {

  _AppTextFieldState(labelText, icon, error, controller, isObscure);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: widget.controller,
        decoration: textInputDecoration.copyWith(
            labelText: widget.labelText,
            prefixIcon: Icon(
              widget.icon,
              color: Theme.of(context).primaryColor,
            )),
        onChanged: (val) {
          setState(() {
             val = widget.controller.text;
          });
        },
        validator: (val) {
          if(widget.icon == Icons.email){
            return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!)
                ? null
                : "لطفا فرم درست ایمیل خود را وارد تمایید.";
          } if(widget.icon == Icons.person){
            if (val!.isNotEmpty) {
              return null;
            } else {
              return "لطفا قسمت نام و نام خانوادگی را تکمیل نمایید.";
            }
          }else{
            if (val!.length < 6) {
              return "رمز عبور نباید کنتر از 6 کاراکتر باشد.";
            } else {
              return null;
            }
          }
        },
      ),
    );
  }
}
