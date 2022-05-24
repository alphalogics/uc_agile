import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:uc_agile/app_const/color_const.dart';

class ZoomToggle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: ColorConst.bar_title,),
      onPressed: () => ZoomDrawer.of(context)!.toggle(),
    );
  }
}
