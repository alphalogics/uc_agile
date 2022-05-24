import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/screens/login_screens/signin_screen.dart';
import 'package:uc_agile/view_model/change_password_view_model/change_password_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

import '../welcome_screen.dart';
import 'forgot_password_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String id = "/ChangePasswordScreen";

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController txtOldPasswordController = new TextEditingController();
  TextEditingController txtNewPasswordController = new TextEditingController();
  TextEditingController txtConfirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChangePasswordViewModel passwordViewModel = Provider.of<ChangePasswordViewModel>(context);
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(ForgotPasswordScreen.id);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: (passwordViewModel.getAppState == AppState.LOADING) ? FullScreenLoader() : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack(
            //   children: [
            //     Center(
            //       child: Text(
            //         "Change Password",
            //         style: GoogleFonts.barlow(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: ColorConst.bar_title,
            //         ),
            //       ),
            //     ),
            //     CustomBackPress(
            //       onTap: () {
            //         Navigator.of(context)
            //             .pushReplacementNamed(ForgotPasswordScreen.id);
            //       },
            //     ),
            //   ],
            // ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "Enter your new password.",
                style: GoogleFonts.barlow(
                  color: ColorConst.forgot_password_des,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomInputField(
              labelText: "Current Password",
              secureText: true,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              txtController: txtOldPasswordController,
            ),
            CustomInputField(
              labelText: "New Password",
              secureText: true,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              txtController: txtNewPasswordController,
            ),CustomInputField(
              labelText: "Confirm New Password",
              secureText: true,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              txtController: txtConfirmPasswordController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomFlatButton(
                btnText: "Change",
                txtColor: Colors.white,
                btnColor: ColorConst.btn_signin,
                onPressed: () async {
                  String oldPassword = txtOldPasswordController.value.text.trim().toString();
                  String newPassword = txtNewPasswordController.value.text.trim().toString();
                  String confirmPassword = txtConfirmPasswordController.value.text.trim().toString();

                  if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
                    showSnackBar(context: context, message: StringConst.empty_fields_msg);
                  }
                  else if (newPassword != confirmPassword) {
                    showSnackBar(context: context, message: "New Password doesn't match");
                  }
                  else {
                    await Provider.of<ChangePasswordViewModel>(context, listen: false).changePasswordDataResponse(oldPassword, newPassword);
                    bool status = passwordViewModel.getCpStatus;
                    if (status) {
                      showSnackBar(context: context, message: passwordViewModel.getCpMsg, mColor: Colors.green);
                      Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
                    }
                    else {
                      showSnackBar(context: context, message: passwordViewModel.getCpMsg);
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
