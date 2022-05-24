import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/screens/registration_screens/billing_address_screen.dart';
import 'package:uc_agile/view_model/registration_view_model/register_participants_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/registration_details_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';

import '../temp_screen.dart';
import 'confirm_detail_screen.dart';

class ParticipantDetailScreen extends StatefulWidget {
  static const String id = "ParticipantDetailScreen";

  @override
  _ParticipantDetailScreenState createState() =>
      _ParticipantDetailScreenState();
}

class _ParticipantDetailScreenState extends State<ParticipantDetailScreen> {
  String? _hearAboutUs;
  List<String> _hearAboutUsList = [];

  String? _timeFormat;
  List<String> _timeFormatList = [];

  String totalParticipants = Singleton.participants.toString();

  int cPart = 0;
  int nPart = 1;
  // int lPart = int.parse(Singleton.participants.toString());
  int lPart = 5;

  final String memAction = "register_member";

  TextEditingController txtParticipantFNController = new TextEditingController();
  TextEditingController txtParticipantLNController = new TextEditingController();
  TextEditingController txtParticipantEmailController = new TextEditingController();
  TextEditingController txtParticipantPhoneController = new TextEditingController();

  String _pFirstName = '';
  String _pLastName = '';
  String _pEmail = '';
  String _pPhone = '';

  List<String> _lFirstName = [];
  List<String> _lLastName = [];
  List<String> _lEmail = [];
  List<String> _lPhone = [];

  @override
  Widget build(BuildContext context) {
    RegistrationDetailViewModel registrationDetailViewModel = Provider.of<RegistrationDetailViewModel>(context);
    RegisterParticipantsViewModel participantsViewModel = Provider.of<RegisterParticipantsViewModel>(context);
    _hearAboutUsList = registrationDetailViewModel.getHearAboutUs;
    _timeFormatList = registrationDetailViewModel.getTimeZone;
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Participation Details",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(BillingAddressScreen.id);
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
                  height: 270,
                  padding: EdgeInsets.only(top: 140),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Virtual",
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Mon, 11 November",
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.assignment_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "CSM",
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "10:00 AM",
                                style: GoogleFonts.barlow(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
                            Singleton.buyerName.toString(),
                            style: GoogleFonts.barlow(
                              color: ColorConst.txt_primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            Singleton.buyerEmail.toString(),
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
              padding: EdgeInsets.only(bottom: 20),
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
                      "Participant $nPart/$lPart",
                      style: GoogleFonts.barlow(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        CustomInputField(
                          labelText: "First Name",
                          secureText: false,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          txtController: txtParticipantFNController,
                        ),
                        CustomInputField(
                          labelText: "Last Name",
                          secureText: false,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          txtController: txtParticipantLNController,
                        ),
                        CustomInputField(
                          labelText: "Primary Email",
                          secureText: false,
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          txtController: txtParticipantEmailController,
                        ),
                        CustomInputField(
                          labelText: "Phone",
                          secureText: false,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.done,
                          txtController: txtParticipantPhoneController,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "* Primary Email and Phone will be used for future communication about class information",
                      style: GoogleFonts.barlow(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  (cPart >= lPart) ? SizedBox() : Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomFlatButton(btnText: "Add Participant", txtColor: Colors.white, btnColor: ColorConst.btn_signin, onPressed: (){
                      _pFirstName = txtParticipantFNController.value.text.toString();
                      _pLastName = txtParticipantLNController.value.text.toString();
                      _pEmail = txtParticipantEmailController.value.text.toString();
                      _pPhone = txtParticipantPhoneController.value.text.toString();
                      if(_pFirstName.isEmpty || _pLastName.isEmpty || _pEmail.isEmpty || _pPhone.isEmpty) {
                        showSnackBar(context: context, message: StringConst.empty_fields_msg);
                      }
                      else if(!RegExp(r'\w+@\w+\.\w+').hasMatch(_pEmail)){
                        showSnackBar(context: context, message: StringConst.incorrect_mail_msg);
                      }
                      else {
                        _lFirstName.add(_pFirstName);
                        _lLastName.add(_pLastName);
                        _lEmail.add(_pEmail);
                        _lPhone.add(_pPhone);

                        txtParticipantFNController.clear();
                        txtParticipantLNController.clear();
                        txtParticipantEmailController.clear();
                        txtParticipantPhoneController.clear();

                        setState(() {
                          cPart++;
                          nPart++;
                          if(nPart > 5) {
                            nPart = 5;
                          }
                        });

                        print(_lFirstName);
                        print(_lLastName);
                        print(_lEmail);
                        print(_lPhone);
                        // Navigator.of(context).pushReplacementNamed(ConfirmDetailScreen.id);
                      }
                    }),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: DropdownButton(
                underline: SizedBox(),
                items: _hearAboutUsList
                    .map((String item) => DropdownMenuItem<String>(
                        child: Text(item), value: item))
                    .toList(),
                hint: Text("Where did you hear about us?"),
                isExpanded: true,
                onChanged: (String? value) {
                  setState(() {
                    this._hearAboutUs = value;
                  });
                },
                value: _hearAboutUs,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: DropdownButton(
                underline: SizedBox(),
                items: _timeFormatList
                    .map((String item) => DropdownMenuItem<String>(
                        child: Text(item), value: item))
                    .toList(),
                hint: Text("Select your convenient timezone"),
                isExpanded: true,
                onChanged: (String? value) {
                  setState(() {
                    this._timeFormat = value;
                  });
                },
                value: _timeFormat,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
                child: CustomFlatButton(
                    btnText: "Confirm",
                    txtColor: Colors.white,
                    btnColor: ColorConst.btn_signin,
                    onPressed: () async {

                      await Provider.of<RegisterParticipantsViewModel>(context, listen: false).addParticipantsDataResponse(memAction, Singleton.mainMemId.toString(), Singleton.eventId.toString(), Singleton.eventSlug.toString(), Singleton.participants.toString(), _lFirstName, _lLastName, _lEmail, _lPhone, '', _hearAboutUs.toString(), _timeFormat.toString());

                      bool status = participantsViewModel.getPartStatus;

                      if(status) {
                        showSnackBar(context: context, message: participantsViewModel.getPartMsg, mColor: Colors.green);
                        Navigator.of(context).pushReplacementNamed(TempScreen.id);
                      }
                      else {
                        showSnackBar(context: context, message: participantsViewModel.getPartMsg);
                      }

                      // print(_lFirstName);
                      // print(_lLastName);
                      // print(_lEmail);
                      // print(_lPhone);

                      // String _pFirstName = txtParticipantFNController.value.text.toString();
                      // String _pLastName = txtParticipantLNController.value.text.toString();
                      // String _pEmail = txtParticipantFNController.value.text.toString();
                      // String _pPhone = txtParticipantPhoneController.value.text.toString();
                      // if(_pFirstName.isEmpty || _pLastName.isEmpty || _pEmail.isEmpty || _pPhone.isEmpty) {
                      //   showSnackBar(context: context, message: StringConst.empty_fields_msg);
                      // }
                      // else {
                      //   Navigator.of(context).pushReplacementNamed(ConfirmDetailScreen.id);
                      // }
                    })),
          ],
        ),
      ),
    );
  }
}
