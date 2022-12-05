import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/auth/login_page.dart';
import 'package:restaurant_app/widget/dimensions.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(
            top: Dimensions.height15,
            right: Dimensions.width10,
            left: Dimensions.width10,
            bottom: Dimensions.height15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) {
                      return const LoginPage();
                    },
                  ),
                );
              },
              child: Container(
                width: Dimensions.width45*3,
                height: Dimensions.height15*3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.deepOrange)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: Dimensions.width10*0.05,),
                    const Text("ورود / عضویت", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold),),
                    const Icon(Icons.person_outline_outlined, color: Colors.white,),
                    SizedBox(width: Dimensions.width10*0.05,),
                  ],
                ),
              ),
            ),
            Image.asset("assets/images/logo.png",
              width: Dimensions.height45,),
          ],
        ),
      ),
    );
  }
}
