import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/screens/login_screens/signin_screen.dart';
import 'package:uc_agile/view_model/auth_view_model/check_otp_view_model.dart';
import 'package:uc_agile/view_model/auth_view_model/resend_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/user_data_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

import '../dashboard_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  static const String id = "/OTPVerificationScreen";

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  FocusNode pin2FocusedNode = FocusNode();
  FocusNode pin3FocusedNode = FocusNode();
  FocusNode pin4FocusedNode = FocusNode();

  Color _container1color = Colors.white;
  Color _container2color = Colors.white;
  Color _container3color = Colors.white;
  Color _container4color = Colors.white;

  Color _text1color = Colors.black;
  Color _text2color = Colors.black;
  Color _text3color = Colors.black;
  Color _text4color = Colors.black;

  TextEditingController txtOtpA = new TextEditingController();
  TextEditingController txtOtpB = new TextEditingController();
  TextEditingController txtOtpC = new TextEditingController();
  TextEditingController txtOtpD = new TextEditingController();

  final String actionResendOtp = 'send';
  final String actionCheckOtp = 'check';
  final String? userId = Singleton.otpUserId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusedNode = FocusNode();
    pin3FocusedNode = FocusNode();
    pin4FocusedNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2FocusedNode = FocusNode();
    pin3FocusedNode = FocusNode();
    pin4FocusedNode = FocusNode();
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    ResendViewModel resendViewModel = Provider.of<ResendViewModel>(context);
    UserDataViewModel userDataViewModel = Provider.of<UserDataViewModel>(context);
    CheckOtpViewModel checkOtpViewModel =
        Provider.of<CheckOtpViewModel>(context);

    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Email Verification",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(SignInScreen.id);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: (resendViewModel.getAppState == AppState.LOADING ||
              checkOtpViewModel.getAppState == AppState.LOADING || userDataViewModel.getAppState == AppState.LOADING)
          ? FullScreenLoader()
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      "Enter your OTP here.",
                      style: GoogleFonts.barlow(
                        color: ColorConst.forgot_password_des,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: _container1color,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: txtOtpA,
                            style: TextStyle(
                              fontSize: 24,
                              color: _text1color,
                            ),
                            decoration: otpInputDecoration,
                            onChanged: (value) {
                              nextField(value, pin2FocusedNode);
                              setState(() {
                                _container1color = ColorConst.otp_bg;
                                _text1color = Colors.white;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: _container2color,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            focusNode: pin2FocusedNode,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: txtOtpB,
                            style: TextStyle(
                              fontSize: 24,
                              color: _text2color,
                            ),
                            decoration: otpInputDecoration,
                            onChanged: (value) {
                              nextField(value, pin3FocusedNode);
                              setState(() {
                                _container2color = ColorConst.otp_bg;
                                _text2color = Colors.white;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: _container3color,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            focusNode: pin3FocusedNode,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: txtOtpC,
                            style: TextStyle(
                              fontSize: 24,
                              color: _text3color,
                            ),
                            decoration: otpInputDecoration,
                            onChanged: (value) {
                              nextField(value, pin4FocusedNode);
                              setState(() {
                                _container3color = ColorConst.otp_bg;
                                _text3color = Colors.white;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: _container4color,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            focusNode: pin4FocusedNode,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: txtOtpD,
                            style: TextStyle(
                              fontSize: 24,
                              color: _text4color,
                            ),
                            decoration: otpInputDecoration,
                            onChanged: (value) {
                              pin4FocusedNode.unfocus();
                              setState(() {
                                _container4color = ColorConst.otp_bg;
                                _text4color = Colors.white;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      "Don't you received any code?",
                      style: GoogleFonts.barlow(
                        color: ColorConst.forgot_password_des,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Provider.of<ResendViewModel>(context, listen: false)
                          .getResendDataResponse(actionResendOtp, userId.toString());
                      bool status = resendViewModel.getResendStatus;
                      String msg = resendViewModel.getResendMsg;
                      if (status) {
                        showSnackBar(
                            context: context,
                            message: msg,
                            mColor: Colors.green);
                      }
                      else {
                        showSnackBar(context: context, message: msg);
                      }
                    },
                    child: Text(
                      "Resend a new code.",
                      style: GoogleFonts.barlow(
                        fontSize: 16,
                        color: ColorConst.otp_bg,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: CustomFlatButton(
                      btnText: "Confirm",
                      txtColor: Colors.white,
                      btnColor: ColorConst.btn_signin,
                      onPressed: () async {
                        String otpA = txtOtpA.value.text.trim().toString();
                        String otpB = txtOtpB.value.text.trim().toString();
                        String otpC = txtOtpC.value.text.trim().toString();
                        String otpD = txtOtpD.value.text.trim().toString();
                        if (otpA.isEmpty ||
                            otpB.isEmpty ||
                            otpC.isEmpty ||
                            otpD.isEmpty) {
                          showSnackBar(
                              context: context,
                              message: StringConst.empty_fields_msg);
                        } else {
                          String otp = otpA + otpB + otpC + otpD;
                          print(otp);
                          await Provider.of<CheckOtpViewModel>(context,
                                  listen: false)
                              .checkOtpDataResponse(otp);
                          bool checkOtpStatus = checkOtpViewModel.getOtpStatus;
                          if(checkOtpStatus) {
                            await Provider.of<UserDataViewModel>(context, listen: false).getUserDataResponse();
                            showSnackBar(context: context, message: checkOtpViewModel.getOtpMsg, mColor: Colors.green);
                            Navigator.of(context).pushReplacementNamed(DashboardScreen.id);
                          }
                          else {
                            clearOtpForm();
                            showSnackBar(context: context, message: checkOtpViewModel.getOtpMsg);
                          }
                        }
                        // Navigator.of(context).pushReplacementNamed(DashboardScreen.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  clearOtpForm() {
    setState(() {
      _container1color = Colors.white;
      _container2color = Colors.white;
      _container3color = Colors.white;
      _container4color = Colors.white;

      txtOtpA.clear();
      txtOtpB.clear();
      txtOtpC.clear();
      txtOtpD.clear();

    });
  }

}
