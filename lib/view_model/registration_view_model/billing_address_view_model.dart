import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/registration_model/billing_address_model.dart';

class BillingAddressViewModel with ChangeNotifier {

  static const String _postBillingDataUrl = '/register/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _addressStatus;

  set setAddressStatus(bool newAddressStatus) {
    _addressStatus = newAddressStatus;
    notifyListeners();
  }

  bool get getAddressStatus => _addressStatus;

  late String _addressMsg;

  set setAddressMsg(String newAddressMsg) {
    _addressMsg = newAddressMsg;
    notifyListeners();
  }

  String get getAddressMsg => _addressMsg;

  Future<dynamic> registerAddressDataResponse(String action, String lineA, String lineB, String zip, String city, String country, String state, {showLoading = true}) async {
    if (showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _body = {
      'action': action,
      'reg_buyer_id': Singleton.mainMemId.toString(),
      'mem_address_line_1': lineA,
      'mem_address_line_2': lineB,
      'mem_zipcode': zip,
      'mem_city': city,
      'mem_state': state,
      'mem_country': country,
    };

    try {
      dynamic response = await ApiBaseHelper().post(url: _postBillingDataUrl, body: _body);
      bool status = response['status'];
      if(status) {
        BillingAddressModel addressModel = BillingAddressModel.fromJson(response);
        setAddressStatus = addressModel.status;
        setAddressMsg = addressModel.data.message;
      }
      else {
        setAddressStatus = response['status'];
        setAddressMsg = response['message'];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setAddressStatus = false;
      setAddressMsg = 'Something went wrong / Try Again';
    }

  }

}