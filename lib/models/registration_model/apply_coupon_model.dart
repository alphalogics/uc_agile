class ApplyCouponModel {
  ApplyCouponModel({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  ApplyCouponModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.status,
    required this.message,
    required this.couponId,
    required this.category,
    required this.type,
    required this.amount,
    required this.couponPayment,
  });
  late final bool status;
  late final String message;
  late final int couponId;
  late final int category;
  late final int type;
  late final int amount;
  late final List<String> couponPayment;

  Data.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    couponId = json['coupon_id'];
    category = json['category'];
    type = json['type'];
    amount = json['amount'];
    couponPayment = List.castFrom<dynamic, String>(json['coupon_payment']);
  }
}