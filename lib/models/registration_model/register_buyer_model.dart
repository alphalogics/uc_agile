class RegisterBuyerModel {
  RegisterBuyerModel({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  RegisterBuyerModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.status,
    required this.mainMemId,
    required this.message,
  });
  late final bool status;
  late final int mainMemId;
  late final String message;

  Data.fromJson(Map<String, dynamic> json){
    status = json['status'];
    mainMemId = json['main_mem_id'];
    message = json['message'];
  }
}