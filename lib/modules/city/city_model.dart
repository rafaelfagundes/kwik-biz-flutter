class City {
  String id;
  String createdAt;
  String updatedAt;
  bool isEnabled;
  String cityName;
  String state;
  String stateInitials;
  int numberOfStores;

  City(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.isEnabled,
      this.cityName,
      this.state,
      this.stateInitials,
      this.numberOfStores});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isEnabled = json['isEnabled'];
    cityName = json['cityName'];
    state = json['state'];
    stateInitials = json['stateInitials'];
    numberOfStores = json['numberOfStores'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isEnabled'] = this.isEnabled;
    data['cityName'] = this.cityName;
    data['state'] = this.state;
    data['stateInitials'] = this.stateInitials;
    data['numberOfStores'] = this.numberOfStores;
    return data;
  }
}
