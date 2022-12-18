import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakoody/app/app_prefs.dart';
import 'package:wakoody/app/constant.dart';
import 'package:wakoody/model/login/login_request_model.dart';
import 'package:wakoody/model/login/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataRepository {
  Future<LoginResponseModel?> login(LoginRequestModel? loginRequestModel);
}

class LoginDataRepositoryImp extends LoginDataRepository {
  static const String endpoint = 'login';

  @override
  Future<LoginResponseModel?> login(LoginRequestModel? loginRequestModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final http.Response response = await http.post(
        Uri.parse(Constant.baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8' ,
          'Accept': 'application/json'
        },
        body: jsonEncode(loginRequestModel?.toJson())
    );
    print('response = $response');
    if(response.statusCode == 200 || response.statusCode == 201 ) {
      Map<String, dynamic> parsedData = jsonDecode(response.body);
      print('parsed === : $parsedData');
      LoginResponseModel responseModel =  LoginResponseModel.fromJson(parsedData);
      AppPreferences(sharedPreferences).setUserToken(responseModel.token) ;
      return responseModel ;
    }
    return null ;
  } // end login()

} // end class
