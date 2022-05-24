import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/screens/registration_screens/buyer_info_screen.dart';
import 'package:uc_agile/screens/registration_screens/participant_details_screen.dart';
import 'package:uc_agile/view_model/registration_view_model/billing_address_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/registration_details_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/custom_input_field.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

class BillingAddressScreen extends StatefulWidget {
  static const String id = "BillingAddressScreen";

  @override
  _BillingAddressScreenState createState() => _BillingAddressScreenState();
}

class _BillingAddressScreenState extends State<BillingAddressScreen> {

  String? _country;
  List<String> myCounteries = [];

  TextEditingController txtAddressAController = new TextEditingController();
  TextEditingController txtAddressBController = new TextEditingController();
  TextEditingController txtCityController = new TextEditingController();
  TextEditingController txtStateController = new TextEditingController();
  TextEditingController txtZipCodeController = new TextEditingController();

  final String billingAction = 'register_address';

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
    BillingAddressViewModel addressViewModel = Provider.of<BillingAddressViewModel>(context);
    myCounteries = _registrationDetailViewModel.getCountriesData;
    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Billing Address",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(BuyerInformationScreen.id);
          },
        ),
        elevation: 0,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: (_registrationDetailViewModel.getAppState == AppState.LOADING || addressViewModel.getAppState == AppState.LOADING) ? FullScreenLoader() : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomInputField(
              labelText: "Address Line 1",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtAddressAController,
            ),
            CustomInputField(
              labelText: "Address Line 2",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtAddressBController,
            ),
            CustomInputField(
              labelText: "Zip Code",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtZipCodeController,
            ),
            CustomInputField(
              labelText: "City",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtCityController,
            ),
            CustomInputField(
              labelText: "State",
              secureText: false,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              txtController: txtStateController,
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
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: DropdownButton(
                underline: SizedBox(),
                items: myCounteries
                    .map((String item) => DropdownMenuItem<String>(
                    child: Text(item), value: item))
                    .toList(),
                hint: Text("Country"),
                isExpanded: true,
                onChanged: (String? value) {
                  setState(() {
                    this._country = value;
                  });
                },
                value: _country,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CustomFlatButton(
                btnText: 'Continue',
                txtColor: Colors.white,
                btnColor: ColorConst.btn_signin,
                onPressed: () async {
                  String _addressA = txtAddressAController.value.text.toString();
                  String _addressB = txtAddressBController.value.text.toString();
                  String _city = txtCityController.value.text.toString();
                  String _state = txtStateController.value.text.toString();
                  String _zip = txtZipCodeController.value.text.toString();
                  String _selectedCountry = _country.toString();

                  if(_addressA.isEmpty || _city.isEmpty || _state.isEmpty || _zip.isEmpty || _country == null) {
                    showSnackBar(context: context, message: StringConst.empty_fields_msg);
                  }
                  else {
                    // print(_selectedCountry);
                    // await Provider.of<BillingAddressViewModel>(context, listen: false).registerAddressDataResponse(billingAction, _addressA, _addressB, _zip, _city, _selectedCountry, _state);
                    // bool status = addressViewModel.getAddressStatus;
                    // if (status) {
                    //   showSnackBar(context: context, message: addressViewModel.getAddressMsg, mColor: Colors.green);
                    //   Navigator.of(context)
                    //       .pushReplacementNamed(ParticipantDetailScreen.id);
                    // }
                    // else {
                    //   showSnackBar(context: context, message: addressViewModel.getAddressMsg);
                    // }


                    Navigator.of(context).pushReplacementNamed(ParticipantDetailScreen.id);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
