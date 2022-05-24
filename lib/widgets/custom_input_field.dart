import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final bool secureText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController txtController;

  CustomInputField({
    required this.labelText,
    required this.secureText,
    required this.inputType,
    required this.inputAction,
    required this.txtController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        obscureText: secureText,
        keyboardType: TextInputType.emailAddress,
        textInputAction: inputAction,
        controller: txtController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: GoogleFonts.barlow(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
