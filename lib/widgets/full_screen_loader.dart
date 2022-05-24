import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uc_agile/app_const/color_const.dart';

class FullScreenLoader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCube(
          size: 50,
          color: ColorConst.splash_bg,
        ),
      ),
    );
  }
}
