import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/change_password/change_password_model.dart';

class ChangePasswordViewModel with ChangeNotifier {

  static const String _postChangePasswordDataUrl = '/users/change_password/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _cpStatus;

  set setCpStatus(bool newCpStatus) {
    _cpStatus = newCpStatus;
    notifyListeners();
  }

  bool get getCpStatus => _cpStatus;

  late String _cpMsg;

  set setCpMsg(String newCpMsg) {
    _cpMsg = newCpMsg;
    notifyListeners();
  }

  String get getCpMsg => _cpMsg;

  Future<dynamic> changePasswordDataResponse(String oldPassword, String newPassword, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _body = {
      'id': Singleton.otpUserId.toString(),
      'current_password': oldPassword,
      'new_password': newPassword,
    };

    try{
      dynamic response = await ApiBaseHelper().post(url: _postChangePasswordDataUrl, body: _body);
      bool status = response['status'];
      if(status) {
        ChangePasswordModel changePasswordModel = ChangePasswordModel.fromJson(response);
        setCpStatus = changePasswordModel.status;
        setCpMsg = changePasswordModel.data.message;
      }
      else {
        setCpStatus = response['status'];
        setCpMsg = response['message'][0];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setCpStatus = false;
      setCpMsg = 'Something went wrong / Try Again';
    }

  }

}