import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/forgot_password_model/forgot_password_model.dart';

class ForgotPasswordViewModel with ChangeNotifier {


  static const String forgotPasswordUrl = '/users/forgot_password/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late String _fpMsg;

  set setFpMsg(String newFpMsg) {
    _fpMsg = newFpMsg;
    notifyListeners();
  }

  String get getFpMsg => _fpMsg;

  late bool _fpStatus;

  set setFpStatus(bool newFpStatus) {
    _fpStatus = newFpStatus;
    notifyListeners();
  }

  bool get getFpStatus => _fpStatus;

  Future<dynamic> checkEmailValidation(String email, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _body = {
      'email': email
    };

    try {
      dynamic response = await ApiBaseHelper().post(url: forgotPasswordUrl, body: _body);
      bool status = response['status'];
      if(status) {
        ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel.fromJson(response);
        setFpStatus = forgotPasswordModel.status;
        Singleton.otpUserId = forgotPasswordModel.data.id.toString();
        setFpMsg = forgotPasswordModel.message;
      }
      else {
        setFpStatus = response['status'];
        setFpMsg = response['message'][0];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setFpStatus = false;
      setFpMsg = 'Something went wrong / Try Again';
    }
  }

}