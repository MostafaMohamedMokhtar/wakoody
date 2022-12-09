class OtpRequestModel {
  String? phoneNumber;
  String? otp;

  OtpRequestModel({this.phoneNumber, this.otp});

  OtpRequestModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['otp'] = this.otp;
    return data;
  }
}
