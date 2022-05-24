class RegisterParticipantsModel {
  RegisterParticipantsModel({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  RegisterParticipantsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.status,
    required this.message,
  });
  late final bool status;
  late final String message;

  Data.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}