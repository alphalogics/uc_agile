import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/screens/registration_screens/billing_address_screen.dart';
import 'package:uc_agile/screens/registration_screens/get_schedule_screen.dart';
import 'package:uc_agile/view_model/registration_view_model/apply_coupon_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/register_buyer_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

class BuyerInformationScreen extends StatefulWidget {
  static const String id = "BuyerInformationScreen";

  @override
  _BuyerInformationScreenState createState() => _BuyerInformationScreenState();
}

class _BuyerInformationScreenState extends State<BuyerInformationScreen> {
  String _participants = '1';
  final _participantList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  TextEditingController txtFirstNameController = new TextEditingController();
  TextEditingController txtLastNameController = new TextEditingController();
  TextEditingController txtEmailController = new TextEditingController();
  TextEditingController txtPhoneController = new TextEditingController();
  TextEditingController txtPromoController = new TextEditingController();

  final String couponAction = 'apply_coupon';
  final String buyerAction = 'register_buyer';
  final String buyerId = '';

  @override
  Widget build(BuildContext context) {
    ApplyCouponViewModel applyCouponViewModel = Provider.of<ApplyCouponViewModel>(context);
    RegisterBuyerViewModel buyerViewModel = Provider.of<RegisterBuyerViewModel>(context);

    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Buyer Information",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(GetScheduleScreen.id);
          },
        ),
        elevation: 0,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: (applyCouponViewModel.getAppState == AppState.LOADING || buyerViewModel.getAppState == AppState.LOADING) ? FullScreenLoader() : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomInputField(
              labelText: "First Name",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtFirstNameController,
            ),
            CustomInputField(
              labelText: "Last Name",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtLastNameController,
            ),
            CustomInputField(
              labelText: "Email",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtEmailController,
            ),
            CustomInputField(
              labelText: "Phone",
              secureText: false,
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,
              txtController: txtPhoneController,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(top: 20),
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
                items: _participantList
                    .map((String item) => DropdownMenuItem<String>(
                        child: Text(item), value: item))
                    .toList(),
                hint: Text("No. of participant"),
                isExpanded: true,
                onChanged: (String? value) {
                  setState(() {
                    this._participants = value.toString();
                  });
                },
                value: _participants,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
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
              child: Column(
                children: [
                  Text('Have you any promo code?', style: TextStyle(fontSize: 16),),
                  CustomInputField(
                    labelText: "Enter Promo Code",
                    secureText: false,
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    txtController: txtPromoController,
                  ),
                  SizedBox(height: 20,),
                  CustomFlatButton(
                    btnText: 'Apply Code',
                    txtColor: Colors.white,
                    btnColor: ColorConst.btn_signin,
                    onPressed: () async {
                      String promo = txtPromoController.value.text.trim().toString();
                      if (promo.isEmpty) {
                        showSnackBar(context: context, message: StringConst.empty_fields_msg);
                      }
                      else {
                        await Provider.of<ApplyCouponViewModel>(context, listen: false).checkApplyCouponResponse(couponAction, promo, Singleton.eventId.toString(), Singleton.eventSlug.toString());
                        bool status = applyCouponViewModel.getCouponStatus;
                        if (status) {
                          showSnackBar(context: context, message: applyCouponViewModel.getCouponMsg, mColor: Colors.green);
                        }
                        else {
                          txtPromoController.clear();
                          showSnackBar(context: context, message: applyCouponViewModel.getCouponMsg);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CustomFlatButton(
                btnText: 'Continue',
                txtColor: Colors.white,
                btnColor: ColorConst.btn_signin,
                onPressed: () async {
                  String _fName = txtFirstNameController.value.text.toString();
                  String _lName = txtLastNameController.value.text.toString();
                  String _email = txtEmailController.value.text.toString();
                  String _phone = txtPhoneController.value.text.toString();

                  if(_fName.isEmpty || _lName.isEmpty || _email.isEmpty || _phone.isEmpty){
                    showSnackBar(context: context, message: StringConst.empty_fields_msg);
                  }
                  else if(!RegExp(r'\w+@\w+\.\w+').hasMatch(_email)){
                    showSnackBar(context: context, message: StringConst.incorrect_mail_msg);
                  }
                  else {
                    await Provider.of<RegisterBuyerViewModel>(context, listen: false).registerByuerDataResponse(buyerAction, _fName, _lName, _email, _phone, Singleton.eventId.toString(), Singleton.eventSlug.toString(), buyerId);
                    bool status = buyerViewModel.getBuyerStatus;
                    if (status) {
                      Singleton.buyerName = _fName + " " + _lName;
                      Singleton.buyerEmail = _email;
                      Singleton.participants = _participants;
                      showSnackBar(context: context, message: buyerViewModel.getBuyerMsg, mColor: Colors.green);
                      Navigator.of(context)
                          .pushReplacementNamed(BillingAddressScreen.id);
                    }
                    else {
                      showSnackBar(context: context, message: buyerViewModel.getBuyerMsg);
                    }

                    // Singleton.buyerName = _fName + " " + _lName;
                    // Singleton.buyerEmail = _email;
                    // Singleton.participants = _participants;

                    print(Singleton.buyerName.toString() + " " + Singleton.buyerEmail.toString() + " " + Singleton.participants.toString());

                    Navigator.of(context).pushReplacementNamed(BillingAddressScreen.id);

                  }
                },
              ),
            ),
            // Expanded(
            //   child: Align(
            //     alignment: FractionalOffset.bottomCenter,
            //     child: Container(
            //       margin: EdgeInsets.all(20),
            //       child: CustomFlatButton(
            //         btnText: 'Continue',
            //         txtColor: Colors.white,
            //         btnColor: ColorConst.btn_signin,
            //         onPressed: () => Navigator.of(context).pushReplacementNamed(BuyerInformationScreen.id),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
