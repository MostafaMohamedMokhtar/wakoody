class LoginRequestModel {
  String? email;
  String? password;
  String? deviceMacAddress;
  String? phoneNumber;

  LoginRequestModel(
      {this.email, this.password, this.deviceMacAddress, this.phoneNumber});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceMacAddress = json['deive_mac_address'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['deive_mac_address'] = this.deviceMacAddress;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
