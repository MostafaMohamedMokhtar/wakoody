
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/model/otp/otp_request_model.dart';
import 'package:wakoody/model/otp/otp_response_model.dart';
import 'package:wakoody/network/otp_service.dart';

final otpProvider = ChangeNotifierProvider<OtpViewModel>((ref) {

  return OtpViewModel(OtpDataRepositoryImp());
});

class OtpViewModel extends ChangeNotifier {
  OtpDataRepository? otpRepo  ;
  OtpResponseModel? responseModel  ;
  bool _isFinished = false ;

  OtpViewModel(this.otpRepo);

  set setTime(bool isFinished){
    _isFinished = isFinished ;
    notifyListeners();
  }

  bool get getTime{
    notifyListeners();
    return _isFinished ;
  }

  Future<void> verifyOtp(OtpRequestModel otpRequestModel) async{
    responseModel = await otpRepo?.verifyOtp(otpRequestModel);
    notifyListeners();
  } // end verifyOtp()

} // end class
