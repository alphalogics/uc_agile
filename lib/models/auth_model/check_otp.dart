class CheckOtpModel {
  CheckOtpModel({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  CheckOtpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.id,
    required this.key,
  });
  late final int id;
  late final String key;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    key = json['key'];
  }
}