class Settings {
  String id;
  DateTime updatedAt;
  int deliveryTime;
  bool acceptsDebitCard;
  Map<String, double> deliveryFeeList;
  String operationHoursType;
  bool acceptsMoney;
  bool acceptsCreditCard;
  int withdrawalTime;
  double deliverySingleFee;
  Map<String, String> operationTimetable;
  Map<String, String> listOfAcceptedCards;
  double minimumOrderValue;
  DateTime createdAt;
  bool acceptsCoupon;
  String deliveryFeeType;

  Settings(
      {this.id,
      this.updatedAt,
      this.deliveryTime,
      this.acceptsDebitCard,
      this.deliveryFeeList,
      this.operationHoursType,
      this.acceptsMoney,
      this.acceptsCreditCard,
      this.withdrawalTime,
      this.deliverySingleFee,
      this.operationTimetable,
      this.listOfAcceptedCards,
      this.minimumOrderValue,
      this.createdAt,
      this.acceptsCoupon,
      this.deliveryFeeType});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updatedAt'];
    deliveryTime = json['deliveryTime'];
    acceptsDebitCard = json['acceptsDebitCard'];
    deliveryFeeList = json['deliveryFeeList'];
    operationHoursType = json['operationHoursType'];
    acceptsMoney = json['acceptsMoney'];
    acceptsCreditCard = json['acceptsCreditCard'];
    withdrawalTime = json['withdrawalTime'];
    deliverySingleFee = json['deliverySingleFee'];
    operationTimetable = json['operationTimetable'];
    listOfAcceptedCards = json['listOfAcceptedCards'];
    minimumOrderValue = json['minimumOrderValue'];
    createdAt = json['createdAt'];
    acceptsCoupon = json['acceptsCoupon'];
    deliveryFeeType = json['deliveryFeeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updatedAt'] = this.updatedAt;
    data['deliveryTime'] = this.deliveryTime;
    data['acceptsDebitCard'] = this.acceptsDebitCard;
    data['deliveryFeeList'] = this.deliveryFeeList;
    data['operationHoursType'] = this.operationHoursType;
    data['acceptsMoney'] = this.acceptsMoney;
    data['acceptsCreditCard'] = this.acceptsCreditCard;
    data['withdrawalTime'] = this.withdrawalTime;
    data['deliverySingleFee'] = this.deliverySingleFee;
    data['operationTimetable'] = this.operationTimetable;
    data['listOfAcceptedCards'] = this.listOfAcceptedCards;
    data['minimumOrderValue'] = this.minimumOrderValue;
    data['createdAt'] = this.createdAt;
    data['acceptsCoupon'] = this.acceptsCoupon;
    data['deliveryFeeType'] = this.deliveryFeeType;
    return data;
  }
}
