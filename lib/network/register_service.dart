import 'dart:convert';

import 'package:wakoody/app/constant.dart';
import 'package:wakoody/model/register/register_request_model.dart';
import 'package:wakoody/model/register/register_response_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterDataRepository {
  Future<RegisterResponseModel?> register(RegisterRequestModel registerRequestModel);
}

class RegisterDataRepositoryImp extends RegisterDataRepository {
  static const String endPoint = 'signup';

  /// Mock endPoint
 // static const String endPoint = 'register';

  @override
  Future<RegisterResponseModel?> register(RegisterRequestModel registerRequestModel) async {
    final http.Response response = await http.post(
        Uri.parse(Constant.baseUrl + endPoint),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8' ,
          'Accept': 'application/json'
        },
        body: jsonEncode(registerRequestModel.toJson()));
        print('response = $response');
      if(response.statusCode == 200 ) {
        Map<String, dynamic> parsedData = jsonDecode(response.body);
        print('parsed === : $parsedData');
        return RegisterResponseModel.fromJson(parsedData);
      }
      return null ;
  } // end register()
} // end class