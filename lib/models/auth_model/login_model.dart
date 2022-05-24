class LoginModel {
  LoginModel({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final LoginData data;
  late final List<String> message;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = LoginData.fromJson(json['data']);
    message = List.castFrom<dynamic, String>(json['message']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class LoginData {
  LoginData({
    required this.id,
  });
  late final int id;

  LoginData.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}