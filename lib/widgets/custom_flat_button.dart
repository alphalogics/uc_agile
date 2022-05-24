import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFlatButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String btnText;
  final Color txtColor, btnColor;

  CustomFlatButton({required this.btnText, required this.txtColor, required this.btnColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity,
            50),
        primary: btnColor,// double.infinity is the width and 30 is the height
      ),
      onPressed: onPressed,
      child: Text(
        btnText,
        style: GoogleFonts.barlow(
          color: txtColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
