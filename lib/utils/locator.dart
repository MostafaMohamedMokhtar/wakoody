import 'package:get_it/get_it.dart';
import 'package:wakoody/model/register/register_request_model.dart';
import 'package:wakoody/model/register/register_response_model.dart';
import 'package:wakoody/network/register_service.dart';
import 'package:wakoody/viewmodel/register_viewmodel.dart';

final GetIt locator = GetIt.instance ;
void setupLocator(){
   locator.registerFactory(() => RegisterDataRepository);
   locator.registerLazySingleton(() => RegisterViewModel);
   locator.registerLazySingleton(() => RegisterResponseModel);
   locator.registerLazySingleton(() => RegisterRequestModel);
} // end setupLocator()