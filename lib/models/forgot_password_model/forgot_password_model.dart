class ForgotPasswordModel {
  ForgotPasswordModel({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final Data data;
  late final String message;

  ForgotPasswordModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }
}

class Data {
  Data({
    required this.id,
  });
  late final int id;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }
}