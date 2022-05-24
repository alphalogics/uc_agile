import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/auth_model/resend_code_model.dart';

class ResendViewModel with ChangeNotifier {

  static const String _resnedOTPUrl = '/users/verify_email/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _resendStatus;

  set setResendStatus(bool newResendStatus) {
    _resendStatus = newResendStatus;
    notifyListeners();
  }

  bool get getResendStatus => _resendStatus;

  late String _resendMsg;

  set setResendMsg(String newResendMsg) {
    _resendMsg = newResendMsg;
    notifyListeners();
  }

  String get getResendMsg => _resendMsg;

  Future<dynamic> getResendDataResponse(String action, String userId, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _body = {
      'action': action,
      'id': userId
    };

    try{
      dynamic response = await ApiBaseHelper().post(url: _resnedOTPUrl, body: _body);
      ResendCodeModel resendCodeModel = ResendCodeModel.fromJson(response);
      setResendStatus = resendCodeModel.status;
      setResendMsg = resendCodeModel.message;
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setResendStatus = false;
      setResendMsg = 'Something went wrong / Try Again';
    }
  }

}