import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';

import '../dashboard_screen.dart';

class EmailInvoiceScreen extends StatelessWidget {

  static const String id = "/EmailInvoiceScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          StringConst.dashboard_title3,
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () => Navigator.of(context).pushReplacementNamed(DashboardScreen.id),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
      ),
    );
  }
}
