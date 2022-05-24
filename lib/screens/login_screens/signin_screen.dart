import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/screens/forgot_password_screens/forgot_password_screen.dart';
import 'package:uc_agile/screens/login_screens/otp_verification_screen.dart';
import 'package:uc_agile/screens/welcome_screen.dart';
import 'package:uc_agile/view_model/auth_view_model/login_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

class SignInScreen extends StatefulWidget {
  static const String id = '/SignInScreen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController txtLoginEmailController = new TextEditingController();
  TextEditingController txtLoginPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginViewModel _loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(WelcomeScreen.id);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: (_loginViewModel.getAppState == AppState.LOADING) ? FullScreenLoader() : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 20),
              child: Center(
                child: Image.asset("assets/logo_color.png"),
              ),
            ),
            CustomInputField(
              labelText: "Email Address",
              secureText: false,
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              txtController: txtLoginEmailController,
            ),
            CustomInputField(
              labelText: "Password",
              secureText: true,
              inputType: TextInputType.text,
              inputAction: TextInputAction.done,
              txtController: txtLoginPasswordController,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(ForgotPasswordScreen.id);
                },
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.barlow(
                    fontSize: 16,
                    color: ColorConst.forgot_password,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CustomFlatButton(
                btnText: "Sign In",
                txtColor: Colors.white,
                btnColor: ColorConst.btn_signin,
                onPressed: () async {
                  String email = txtLoginEmailController.value.text.trim().toString();
                  String password = txtLoginPasswordController.value.text.trim().toString();
                  if (email.isEmpty || password.isEmpty){
                    showSnackBar(context: context, message: StringConst.empty_fields_msg);
                  }
                  else {
                    await Provider.of<LoginViewModel>(context, listen: false).getLoginDataResponse(email, password);
                    bool status = _loginViewModel.getLoginStatus;
                    String msg = _loginViewModel.getLoginMessage;
                    if(status) {
                     showSnackBar(context: context, message: msg, mColor: Colors.green);
                     Navigator.of(context).pushReplacementNamed(OTPVerificationScreen.id);
                    }
                    else {
                      showSnackBar(context: context, message: msg);
                    }
                  }

                  // Navigator.of(context).pushReplacementNamed(OTPVerificationScreen.id)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
