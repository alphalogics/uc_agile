import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/registration_model/register_buyer_model.dart';

class RegisterBuyerViewModel with ChangeNotifier {

  static const String _postBuyerDataUrl = '/register/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _buyerStatus;

  set setBuyerStatus(bool newBuyerStatus) {
    _buyerStatus = newBuyerStatus;
    notifyListeners();
  }

  bool get getBuyerStatus => _buyerStatus;

  late String _buyerMsg;

  set setBuyerMsg(String newBuyerMsg) {
    _buyerMsg = newBuyerMsg;
    notifyListeners();
  }

  String get getBuyerMsg => _buyerMsg;

  Future<dynamic> registerByuerDataResponse(String action, String fName, String lName, String email, String phone, String eventId, String eventSlug, String buyerId, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _body = {
      'action': action,
      'fName': fName,
      'lName': lName,
      'email': email,
      'phone': phone,
      'eventId': eventId,
      'eventSlug': eventSlug,
      'buyerId': buyerId,
    };

    try {
      dynamic response = await ApiBaseHelper().post(url: _postBuyerDataUrl, body: _body);
      bool status = response['status'];
      if(status) {
        RegisterBuyerModel buyerModel = RegisterBuyerModel.fromJson(response);
        setBuyerStatus = buyerModel.status;
        setBuyerMsg = buyerModel.data.message;
        Singleton.mainMemId = buyerModel.data.mainMemId.toString();
      }
      else {
        setBuyerStatus = response['status'];
        setBuyerMsg = response['message'];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setBuyerStatus = false;
      setBuyerMsg = 'Something went wrong / Try Again';
    }

  }

}