import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uc_agile/screens/welcome_screen.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';

import 'color_const.dart';

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.white),
  );
}

void showCustomDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
              color: ColorConst.txt_secondary,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.done_rounded,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 180,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Your payment has been done Successfully",
                  style: GoogleFonts.barlow(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$465", style: GoogleFonts.barlow(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                    Text("Paid", style: GoogleFonts.barlow(
                      color: Colors.black,
                      fontSize: 16,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              CustomFlatButton(btnText: 'Done', btnColor: ColorConst.btn_signin, txtColor: Colors.white, onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
              },),
            ],
          ),
        ),
      );
    });

void showSimpleDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: ColorConst.txt_secondary,
              borderRadius: BorderRadius.circular(250)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.done_rounded,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 180,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Your payment has been done Successfully",
                  style: GoogleFonts.barlow(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    });

void showSnackBar({
  required BuildContext context,
  required String message,
  Color mColor = Colors.red,
  int duration = 3200,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: duration),
      backgroundColor: mColor,
    ),
  );
}
