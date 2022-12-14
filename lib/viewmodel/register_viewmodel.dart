import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/model/register/register_request_model.dart';
import 'package:wakoody/model/register/register_response_model.dart';
import 'package:wakoody/network/register_service.dart';
import 'package:wakoody/utils/locator.dart';

final registerProvider = ChangeNotifierProvider<RegisterViewModel>((ref) {

  return RegisterViewModel(RegisterDataRepositoryImp());
});

class RegisterViewModel extends ChangeNotifier {
   RegisterDataRepository? registerRepo  ;
   RegisterResponseModel? responseModel  ;

  RegisterViewModel(this.registerRepo);
  String? imagePath;

  final picker = ImagePicker();
  File? image;
  SharedPreferences? preferences;

  Future<void> register(RegisterRequestModel registerRequestModel) async{
    responseModel = await registerRepo?.register(registerRequestModel);
    notifyListeners();
}

  void saveImage(String? path) async {
    preferences = await SharedPreferences.getInstance();
    preferences?.setString("imagePath", path!);
    notifyListeners();
  } // end saveImage()

  void loadImage() async {
    preferences = await SharedPreferences.getInstance();
    imagePath = preferences?.getString("imagePath");
    notifyListeners();
  } // end loadImage()

  imgFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    notifyListeners();
  } // end imgFromGallery()

  imgFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    notifyListeners();
  } // end imgFromCamera()

} // end class
