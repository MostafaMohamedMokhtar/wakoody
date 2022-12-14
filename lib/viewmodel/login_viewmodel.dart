
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/model/login/login_request_model.dart';
import 'package:wakoody/model/login/login_response_model.dart';
import 'package:wakoody/network/login_service.dart';

final loginProvider = ChangeNotifierProvider<LoginViewModel>((ref) {

  return LoginViewModel(LoginDataRepositoryImp());
});

class LoginViewModel extends ChangeNotifier {
  LoginDataRepository? loginRepo  ;
  LoginResponseModel? responseModel  ;

  LoginViewModel(this.loginRepo);


  Future<void> login(LoginRequestModel loginRequestModel) async{
    responseModel = await loginRepo?.login(loginRequestModel);
    notifyListeners();
  } // end login()

} // end class
