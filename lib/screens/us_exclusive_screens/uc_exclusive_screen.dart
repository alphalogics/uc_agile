import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/screens/us_exclusive_screens/menu_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/tip_tricks_screen.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';

import '../dashboard_screen.dart';

class UcExclusiveScreen extends StatelessWidget {

  static const String id = "/UcExclusiveScreen";

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(menuScreen: MenuScreen(), mainScreen: TipTricksScreen());
  }
}
