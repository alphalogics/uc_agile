import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/uc_exclusive/uc_exclusive_model.dart';

class ExclusiveViewModel with ChangeNotifier {

  static const String _userMaterialURL = '/users/materials/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late String _materialMsg;

  set setMaterialMsg(String newMaterialMsg) {
    _materialMsg = newMaterialMsg;
    notifyListeners();
  }

  String get getMaterialMsg => _materialMsg;

  late bool _materialStatus;

  set setMaterialStatus(bool newMaterialStatus) {
    _materialStatus = newMaterialStatus;
    notifyListeners();
  }

  bool get getMaterialStatus => _materialStatus;

  late List<MaterialContent> _materialList = [];

  set setMaterialList(List<MaterialContent> newMaterialList) {
    _materialList = newMaterialList;
    notifyListeners();
  }

  List<MaterialContent> get getMaterialList => _materialList;

  Future<dynamic> getMaterialDataResponse(String id, String key, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _params = {
      'id': id,
      'key': key
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _userMaterialURL, params: _params);
      bool status = response['status'];
      print(status);
      if(status) {
        ExclusiveModel exclusiveModel = ExclusiveModel.fromJson(response);
        setMaterialList = exclusiveModel.data[0].materialContent;
        print(exclusiveModel.data[0].materialContent[0].type);
        print(exclusiveModel.data[0].materialContent[0].title);
        print(exclusiveModel.data[0].materialContent[0].description);
        print(exclusiveModel.data[0].materialContent[0].audioUrl);
        print(exclusiveModel.data[0].materialContent[0].date);
        print(exclusiveModel.data[0].materialContent[0].startTime);
        print(exclusiveModel.data[0].materialContent[0].endTime);
        print(exclusiveModel.data[0].materialContent[0].iframe);
        print(exclusiveModel.data[0].materialContent[0].imageUrl);
        print(exclusiveModel.data[0].materialContent[0].pdfUrl);
        print(exclusiveModel.data[0].materialContent[0].question);
        print(exclusiveModel.data[0].materialContent[0].answer);
      }
      else {
        print("ops");
      }
      setAppState = AppState.IDLE;
      // CheckOtpModel checkOtpModel = CheckOtpModel.fromJson(response);
      // print(checkOtpModel.status);
    } on Exception catch (e) {
      print('error: $e');
    }
  }

}