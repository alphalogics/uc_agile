import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';

import '../dashboard_screen.dart';

class ReferFriendScreen extends StatelessWidget {
  static const String id = "/ReferFriendScreen";

  TextEditingController txtRefNameController = new TextEditingController();
  TextEditingController txtRefEmailController = new TextEditingController();
  TextEditingController txtRefPhoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          StringConst.dashboard_title2,
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(DashboardScreen.id),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomInputField(
                labelText: "Name",
                secureText: false,
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
                txtController: txtRefNameController,
              ),
              CustomInputField(
                labelText: "Email Address",
                secureText: false,
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                txtController: txtRefEmailController,
              ),
              CustomInputField(
                labelText: "Phone No.",
                secureText: false,
                inputType: TextInputType.number,
                inputAction: TextInputAction.done,
                txtController: txtRefPhoneController,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: CustomFlatButton(
                  btnText: "Send Invitation",
                  txtColor: Colors.white,
                  btnColor: ColorConst.btn_signin,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
