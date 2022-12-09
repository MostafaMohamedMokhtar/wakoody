class RegisterRequestModel {
  String? name;
  String? password;
  String? email;
  String? phoneNumber;
  String? longitude;
  String? latitude;
  String? macAddress;

  RegisterRequestModel(
      {this.name,
        this.password,
        this.email,
        this.phoneNumber,
        this.longitude,
        this.latitude,
        this.macAddress});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    macAddress = json['mac_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['mac_address'] = this.macAddress;
    return data;
  }
}
