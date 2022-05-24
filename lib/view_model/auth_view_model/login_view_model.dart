import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/auth_model/login_model.dart';

class LoginViewModel with ChangeNotifier {
  static const String _getLoginUrl = '/users/login/';

  late LoginModel _loginModel;

  set setLoginModel(LoginModel newLoginModel) {
    _loginModel = newLoginModel;
    notifyListeners();
  }

  LoginModel get getLoginModel => _loginModel;

  late LoginData _loginData;

  set setLoginData(LoginData newLoginData) {
    _loginData = newLoginData;
    notifyListeners();
  }

  LoginData get getLoginData => _loginData;

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newState) {
    _appState = newState;
    notifyListeners();
  }

  late String message = '';

  set setLoginMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }

  String get getLoginMessage => message;

  late bool loginStatus = false;

  set setLoginStatus(bool newStatus) {
    loginStatus = newStatus;
    notifyListeners();
  }

  bool get getLoginStatus => loginStatus;

  AppState get getAppState => _appState;

  Future<dynamic> getLoginDataResponse(String email, String password, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _body = {
      'email': email,
      'password': password
    };

    try{
      dynamic response = await ApiBaseHelper().post(url: _getLoginUrl, body: _body);
      bool data = response['status'];
      print(data);
      if(data) {
        LoginModel loginModel = LoginModel.fromJson(response);
        setLoginStatus = true;
        setLoginModel = loginModel;
        setLoginData = loginModel.data;
        setLoginMessage = loginModel.message[0];
        Singleton.otpUserId = loginModel.data.id.toString();
        print(loginModel.status);
        print(loginModel.data.id);
        print(loginModel.message[0]);
      }
      else {
        setLoginStatus = false;
        setLoginMessage = response['message'][0];
        print(response['message'][0]);
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setLoginMessage = "$e";
    }
  }

}