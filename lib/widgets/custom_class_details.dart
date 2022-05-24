import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomClassDetail extends StatelessWidget {

  final String courseName;
  final String courseImgLink;

  CustomClassDetail({
   required this.courseName,
   required this.courseImgLink
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 5, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image.network(courseImgLink),
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Live Online Training",
                  style: GoogleFonts.barlow(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "$courseName",
                  style: GoogleFonts.barlow(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
}

