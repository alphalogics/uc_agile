import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/screens/registration_screens/confirm_detail_screen.dart';
import 'package:uc_agile/view_model/registration_view_model/registration_details_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';


class CardDetailsScreen extends StatefulWidget {
  static const String id = "CardDetailsScreen";

  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  String? _cardCountry;
  List<String> _countryList = [];

  TextEditingController txtCardNameController = new TextEditingController();
  TextEditingController txtCardNumberController = new TextEditingController();
  TextEditingController txtCardDateController = new TextEditingController();
  TextEditingController txtCardCVVController = new TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     Provider.of<RegistrationDetailViewModel>(context, listen: false)
  //         .getRegistrationSettingDetails('get_registration_settings');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    RegistrationDetailViewModel registrationDetailViewModel = Provider.of<RegistrationDetailViewModel>(context);
    _countryList = registrationDetailViewModel.getCountriesData;
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Card Details",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ConfirmDetailScreen.id);
          },
        ),
        elevation: 0,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
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
                      "Card Details",
                      style: GoogleFonts.barlow(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Column(
                        children: [
                          Image.asset('assets/card_sample.png'),
                          CustomInputField(
                              labelText: 'Name on Card',
                              secureText: false,
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                          txtController: txtCardNameController,),
                          CustomInputField(
                              labelText: 'Card Number',
                              secureText: false,
                              inputType: TextInputType.number,
                              inputAction: TextInputAction.next,
                          txtController: txtCardNumberController,),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomInputField(
                                      labelText: 'Exp. Date',
                                      secureText: false,
                                      inputType: TextInputType.text,
                                      inputAction: TextInputAction.next,
                                  txtController: txtCardDateController,)),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: CustomInputField(
                                      labelText: 'CVV',
                                      secureText: false,
                                      inputType: TextInputType.number,
                                      inputAction: TextInputAction.next,
                                  txtController: txtCardCVVController,)),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(top: 20, bottom: 20),
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
                              items: _countryList
                                  .map((String item) =>
                                      DropdownMenuItem<String>(
                                          child: Text(item), value: item))
                                  .toList(),
                              hint: Text("Country"),
                              isExpanded: true,
                              onChanged: (String? value) {
                                setState(() {
                                  this._cardCountry = value;
                                });
                              },
                              value: _cardCountry,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
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
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CustomFlatButton(
                btnText: 'Make Payment',
                txtColor: Colors.white,
                btnColor: ColorConst.btn_signin,
                onPressed: () {
                  String _cardName = txtCardNameController.value.text.toString();
                  String _cardNumber = txtCardNumberController.value.text.toString();
                  String _cardCVV = txtCardCVVController.value.text.toString();
                  String _cardDate = txtCardDateController.value.text.toString();

                  if(_cardName.isEmpty || _cardNumber.isEmpty || _cardCVV.isEmpty || _cardDate.isEmpty) {
                    showSnackBar(context: context, message: StringConst.empty_fields_msg);
                  }
                  else {

                  }

                  showCustomDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
