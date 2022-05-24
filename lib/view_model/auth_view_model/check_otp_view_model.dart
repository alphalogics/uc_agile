import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/auth_model/check_otp.dart';

class CheckOtpViewModel with ChangeNotifier {

  static const String _checkOtpUrl = '/users/verify_email/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late String _otpMsg;

  set setOtpMsg(String newOtpMsg) {
    _otpMsg = newOtpMsg;
    notifyListeners();
  }

  String get getOtpMsg => _otpMsg;

  late bool _otpStatus;

  set setOtpStatus(bool newOtpStatus) {
    _otpStatus = newOtpStatus;
    notifyListeners();
  }

  bool get getOtpStatus => _otpStatus;

  Future<dynamic> checkOtpDataResponse(String otp, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _params = {
      'action': 'check',
      'id': Singleton.otpUserId.toString(),
      'otp': otp
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _checkOtpUrl, params: _params);
      bool status = response['status'];
      print(status);
      if(status) {
        CheckOtpModel checkOtpModel = CheckOtpModel.fromJson(response);
        Singleton.userLoginKey = checkOtpModel.data.key;
        setOtpStatus = checkOtpModel.status;
        setOtpMsg = 'Login Successfully';
        print(checkOtpModel.status);
      }
      else {
        setOtpStatus = response['status'];
        setOtpMsg = response['message'][0];
        print(response['message'][0]);
      }
      setAppState = AppState.IDLE;
      // CheckOtpModel checkOtpModel = CheckOtpModel.fromJson(response);
      // print(checkOtpModel.status);
    } on Exception catch (e) {
      print('error');
      setOtpStatus = false;
      setAppState = AppState.ERROR;
      setOtpMsg = 'Something went wrong / Try Again';
    }
  }

}