import 'package:flutter/cupertino.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/registration_model/apply_coupon_model.dart';

class ApplyCouponViewModel with ChangeNotifier {

  static const String _getCouponDataUrl = '/register/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _couponStatus;

  set setCouponStatus(bool newCouponStatus) {
    _couponStatus = newCouponStatus;
    notifyListeners();
  }

  bool get getCouponStatus => _couponStatus;

  late String _couponMsg;

  set setCouponMsg(String newCouponMsg) {
    _couponMsg = newCouponMsg;
    notifyListeners();
  }

  String get getCouponMsg => _couponMsg;

  Future<dynamic> checkApplyCouponResponse(String action, String couponCode, String eventId, String eventSlug, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _params = {
      'action': action,
      'code': couponCode,
      'event_id': eventId,
      'event_slug': eventSlug,
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _getCouponDataUrl, params: _params);
      bool status = response['status'];
      if(status) {
        ApplyCouponModel applyCouponModel = ApplyCouponModel.fromJson(response);
        setCouponStatus = applyCouponModel.status;
        setCouponMsg = applyCouponModel.data.message;
      }
      else {
        setCouponStatus = response['status'];
        setCouponMsg = response['message'];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setCouponStatus = false;
      setCouponMsg = 'Something went wrong / Try Again';
    }

  }

}