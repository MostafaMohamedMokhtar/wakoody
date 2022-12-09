import 'dart:convert';

import 'package:wakoody/app/constant.dart';
import 'package:wakoody/model/login/login_request_model.dart';
import 'package:wakoody/model/login/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataRepository {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel);
}

class LoginDataRepositoryImp extends LoginDataRepository {
  static const String endpoint = 'login';

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    final http.Response response = await http.post(
        Uri.parse(Constant.baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8' ,
          'Accept': 'application/json'
        },
        body: jsonEncode(loginRequestModel.toJson())
    );
    Map<String , dynamic> parsedData = jsonDecode(response.body);
    return LoginResponseModel.fromJson(parsedData);
  } // end login()
} // end class
