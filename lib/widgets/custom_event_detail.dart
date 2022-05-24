import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEventDetail extends StatelessWidget {

  final VoidCallback onPressed;
  final String txtInstructorName;
  final String txtEventSchedule;
  final String txtEventTime;
  final String imgAvatar;
  final Color txtColor;
  final Color bgColor;

  CustomEventDetail({
    required this.onPressed,
    required this.txtInstructorName,
    required this.txtEventSchedule,
    required this.txtEventTime,
    required this.imgAvatar,
    this.txtColor = Colors.black,
    this.bgColor = Colors.white,
});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imgAvatar),
            ),
            Expanded(
              child: Container(
                height: 60,
                padding: EdgeInsets.only(left: 10, right: 10),
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(txtInstructorName, style: GoogleFonts.barlow(
                          color: txtColor,
                          fontWeight: FontWeight.w500,
                        ),),
                        Text(txtEventSchedule, style: GoogleFonts.barlow(
                          color: txtColor,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    Text(
                      txtEventTime,
                      style: GoogleFonts.barlow(
                        color: txtColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
