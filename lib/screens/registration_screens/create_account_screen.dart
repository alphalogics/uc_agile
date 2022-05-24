import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/screens/welcome_screen.dart';
import 'package:uc_agile/view_model/registration_view_model/registration_details_view_model.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String id = "/CreateAccountScreen";

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  List<String> myCounteries = [];

  String? _participants;
  final List<String> _participantList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<RegistrationDetailViewModel>(context, listen: false)
          .getRegistrationSettingDetails('get_registration_settings');
    });

  }


  @override
  Widget build(BuildContext context) {
    RegistrationDetailViewModel _registrationDetailViewModel = Provider.of<RegistrationDetailViewModel>(context);
    myCounteries = _registrationDetailViewModel.getCountriesData;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://ucagile.com/event-tool/beta/assets/img/uploads/1625562678Trainers%20Photo_480x440_7.jpg"),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bonsy Yelsangi",
                          style: GoogleFonts.barlow(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dec 02 - Dec 03", style: GoogleFonts.barlow(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                            Text("10 AM to 6 PM EST", style: GoogleFonts.barlow(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomFlatButton(btnText: "Ok", txtColor: Colors.white, btnColor: Colors.amber, onPressed: (){
              myCounteries = _registrationDetailViewModel.getRegistrationDetails.data.countries;
              print(myCounteries);
            }),
            CustomFlatButton(btnText: "Back", txtColor: Colors.white, btnColor: Colors.amber, onPressed: () => Navigator.of(context).pushReplacementNamed(WelcomeScreen.id),),

            DropdownButton(
              underline: SizedBox(),
              items: myCounteries
                  .map((String item) => DropdownMenuItem<String>(
                  child: Text(item, style: GoogleFonts.barlow(),), value: item))
                  .toList(),
              hint: Text("Country"),
              isExpanded: true,
              onChanged: (String? value) {
                setState(() {
                  this._participants = value;
                });
              },
              value: _participants,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
              ),
            ),

            GestureDetector(
              onTap: () {
                print("Test");
              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://ucagile.com/event-tool/beta/assets/img/uploads/1625562678Trainers%20Photo_480x440_7.jpg"),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bonsy Yelsangi",
                              style: GoogleFonts.barlow(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Dec 02 - Dec 03", style: GoogleFonts.barlow(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                                Text("10 AM to 6 PM EST", style: GoogleFonts.barlow(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ],
                            ),
                          ],
                        ),
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
