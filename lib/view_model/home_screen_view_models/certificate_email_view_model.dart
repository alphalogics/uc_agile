import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/home_screen_models/certificate_email_model.dart';

class CertificateEmailViewModel with ChangeNotifier {

  static const String _getCertificateEmailURL = '/users/email_certificate/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _certificateStatus;

  set setCertificateStatus(bool newCertificateStatus) {
    _certificateStatus = newCertificateStatus;
    notifyListeners();
  }

  bool get getCertificateStatus => _certificateStatus;

  late String _certificateMsg;

  set setCertificateMsg(String newCertificateMsg) {
    _certificateMsg = newCertificateMsg;
    notifyListeners();
  }

  String get getCertificateMsg => _certificateMsg;

  Future<dynamic> getCertificateEmailDataResponse({showLoading = true}) async {
    if(showLoading == true) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _params = {
      'action': 'send',
      'member_id': Singleton.otpUserId.toString(),
      'key': Singleton.userLoginKey.toString(),
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _getCertificateEmailURL, params: _params);
      bool status = response['status'];
      if(status) {
        CertificateEmailModel emailModel = CertificateEmailModel.fromJson(response);
        setCertificateStatus = emailModel.data.status;
        setCertificateMsg = emailModel.data.message;
      }
      else {
        setCertificateStatus = false;
        setCertificateMsg = response['message'][0];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setCertificateStatus = false;
      setCertificateMsg = 'Something went wrong / Try Again';
    }
  }

}