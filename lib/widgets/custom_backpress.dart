import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uc_agile/app_const/color_const.dart';

class CustomBackPress extends StatelessWidget {

  final VoidCallback onTap;

  CustomBackPress({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 26, top: 13, bottom: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0 , 0),
            ),
          ],
        ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: ColorConst.back_icon,
          size: 20,
        ),
      ),
    );
  }
}
