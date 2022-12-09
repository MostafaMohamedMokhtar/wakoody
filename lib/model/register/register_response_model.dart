class RegisterResponseModel {
  Data? data;
  String? message;
  Errors? errors;

  RegisterResponseModel({this.data, this.message, this.errors});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    errors =
    json['errors'] != null ?  Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? phoneNumber;
  String? name;
  String? email;
  String? longitude;
  String? latitude;
  String? macAddrss;

  Data(
      {this.id,
        this.phoneNumber,
        this.name,
        this.email,
        this.longitude,
        this.latitude,
        this.macAddrss});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    name = json['name'];
    email = json['email'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    macAddrss = json['mac_addrss'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['name'] = this.name;
    data['email'] = this.email;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['mac_addrss'] = this.macAddrss;
    return data;
  }
}

class Errors {
  List<String>? phoneNumber;
  List<String>? macAddress;

  Errors({this.phoneNumber, this.macAddress});

  Errors.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'].cast<String>();
    macAddress = json['mac_address'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['mac_address'] = this.macAddress;
    return data;
  }
}
