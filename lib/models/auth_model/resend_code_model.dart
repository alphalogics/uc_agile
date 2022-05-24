class ResendCodeModel {
  ResendCodeModel({
    required this.status,
    required this.message,
  });
  late final bool status;
  late final String message;

  ResendCodeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}