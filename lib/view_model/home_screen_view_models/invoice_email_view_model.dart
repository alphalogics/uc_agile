import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/home_screen_models/invoice_email_model.dart';

class InvoiceEmailViewModel with ChangeNotifier {

  static const String _getInvoiceEmailURL = '/users/email_invoice/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _invoiceStatus;

  set setInvoiceStatus(bool newInvoiceStatus) {
    _invoiceStatus = newInvoiceStatus;
    notifyListeners();
  }

  bool get getInvoiceStatus => _invoiceStatus;

  late String _invoiceMsg;

  set setInvoiceMsg(String newInvoiceMsg) {
    _invoiceMsg = newInvoiceMsg;
    notifyListeners();
  }

  String get getInvoiceMsg => _invoiceMsg;

  Future<dynamic> getInvoiceEmailDataResponse({showLoading = true}) async {
    if(showLoading == true) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _params = {
      'action': 'send',
      'member_id': Singleton.otpUserId.toString(),
      'key': Singleton.userLoginKey.toString(),
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _getInvoiceEmailURL, params: _params);
      bool status = response['status'];
      if(status) {
        InvoiceEmailModel emailModel = InvoiceEmailModel.fromJson(response);
        setInvoiceStatus = emailModel.data.status;
        setInvoiceMsg = emailModel.data.message;
      }
      else {
        setInvoiceStatus = false;
        setInvoiceMsg = response['message'][0];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setInvoiceStatus = false;
      setInvoiceMsg = 'Something went wrong / Try Again';
    }
  }

}