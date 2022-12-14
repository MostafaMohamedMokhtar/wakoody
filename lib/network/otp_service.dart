import 'dart:convert';

import 'package:wakoody/app/constant.dart';
import 'package:http/http.dart' as http;
import 'package:wakoody/model/otp/otp_request_model.dart';
import 'package:wakoody/model/otp/otp_response_model.dart';

abstract class OtpDataRepository {
  Future<OtpResponseModel?> verifyOtp(OtpRequestModel otpRequestModel);
}

class OtpDataRepositoryImp extends OtpDataRepository {
  static const String endpoint = 'verify-otp';

  @override
  Future<OtpResponseModel?> verifyOtp(OtpRequestModel otpRequestModel) async {
    final http.Response response = await http.post(
        Uri.parse(Constant.baseUrl + endpoint),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8' ,
          'Accept': 'application/json'
        },
        body: jsonEncode(otpRequestModel.toJson())
    );
    print('response = $response');
    if(response.statusCode == 200 ) {
      Map<String, dynamic> parsedData = jsonDecode(response.body);
      print('parsed === : $parsedData');
      return OtpResponseModel.fromJson(parsedData);
    }
    return null ;
  } // end login()
} // end class
