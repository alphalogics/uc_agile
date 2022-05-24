import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/screens/registration_screens/card_details_screen.dart';
import 'package:uc_agile/screens/registration_screens/participant_details_screen.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';

class ConfirmDetailScreen extends StatefulWidget {
  static const String id = "ConfirmDetailScreen";

  @override
  _ConfirmDetailScreenState createState() => _ConfirmDetailScreenState();
}

class _ConfirmDetailScreenState extends State<ConfirmDetailScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Payment",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(ParticipantDetailScreen.id);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 380,
                  padding: EdgeInsets.only(top: 140, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: ColorConst.txt_secondary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 3),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Image.asset('assets/cspo_certificate.png'),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 170,
                            child: Text(
                              "Certified Scrum Product Owner",
                              style: GoogleFonts.barlow(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Course Fee", style: GoogleFonts.barlow(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),),
                          Text("\$465.00", style: GoogleFonts.barlow(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),),
                        ],
                      ),
                      Divider(color: Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 80,
                              width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Date", style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                                SizedBox(height: 10,),
                                Text("11 Nov, 2021", style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ],
                            )
                          ),
                          Container(
                              height: 80,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Time", style: GoogleFonts.barlow(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  SizedBox(height: 10,),
                                  Text("10:00 AM", style: GoogleFonts.barlow(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                ],
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 3),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.asset("assets/avatar.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ahmad Ijaz",
                            style: GoogleFonts.barlow(
                              color: ColorConst.txt_primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "ahmadijaz@gmail.com",
                            style: GoogleFonts.barlow(
                              color: ColorConst.txt_secondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0.5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Text(
                      "Payment Method",
                      style: GoogleFonts.barlow(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 80,
                          width: 140,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ]
                          ),
                          child: Image.asset('assets/stripe_logo.png'),
                        ),
                        Container(
                          height: 80,
                          width: 140,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ]
                          ),
                          child: Image.asset('assets/spliit_logo.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: CustomFlatButton(
                    btnText: "Checkout",
                    txtColor: Colors.white,
                    btnColor: ColorConst.btn_signin,
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(CardDetailsScreen.id))),
          ],
        ),
      ),
    );
  }
}
