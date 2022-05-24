import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/screens/forgot_password_screens/change_password_screen.dart';
import 'package:uc_agile/screens/login_screens/signin_screen.dart';
import 'package:uc_agile/view_model/forgot_password_view_model/forgot_password_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = "/ForgotPasswordScreen";

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController txtEmailAddressController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ForgotPasswordViewModel forgotPasswordViewModel = Provider.of<ForgotPasswordViewModel>(context);
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(SignInScreen.id);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: (forgotPasswordViewModel.getAppState == AppState.LOADING)
        ? FullScreenLoader() : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "Please enter your email address. You will receive a link to create a new password via email.",
                style: GoogleFonts.barlow(
                  color: ColorConst.forgot_password_des,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomInputField(
              labelText: "Email Address",
              secureText: false,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              txtController: txtEmailAddressController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomFlatButton(
                btnText: "Next",
                txtColor: Colors.white,
                btnColor: ColorConst.btn_signin,
                onPressed: () async {
                  String email = txtEmailAddressController.value.text.trim().toString();
                  if (email.isEmpty) {
                    showSnackBar(context: context, message: StringConst.empty_fields_msg);
                  }
                  else {
                    await Provider.of<ForgotPasswordViewModel>(context, listen: false).checkEmailValidation(email);
                    bool status = forgotPasswordViewModel.getFpStatus;
                    if(status) {
                      showSnackBar(context: context, message: forgotPasswordViewModel.getFpMsg, mColor: Colors.green);
                      Navigator.of(context).pushReplacementNamed(ChangePasswordScreen.id);
                    }
                    else {
                      showSnackBar(context: context, message: forgotPasswordViewModel.getFpMsg);
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
