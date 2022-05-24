import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardOptionItem extends StatelessWidget {

  final Color bgColor;
  final String itemText;
  final VoidCallback onTap;

  DashboardOptionItem({required this.bgColor, required this.itemText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 105,
        width: 105,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          itemText,
          textAlign: TextAlign.center,
          style: GoogleFonts.barlow(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
