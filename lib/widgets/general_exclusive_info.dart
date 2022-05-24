import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:uc_agile/app_const/color_const.dart';

class ExclusiveInfo extends StatelessWidget {

  final String materialTitle;
  final String materialDes;

  ExclusiveInfo({
    required this.materialTitle,
    required this.materialDes,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1)),
        ],
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: ColorConst.splash_bg,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.album_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(materialTitle, style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 5,),
                Text(materialDes),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 10, right: 5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorConst.back_icon,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
