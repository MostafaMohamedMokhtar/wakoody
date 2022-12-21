import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:mac_address/mac_address.dart';
import 'package:wakoody/model/register/register_request_model.dart';
import 'package:wakoody/model/register/register_response_model.dart';
import 'package:wakoody/network/register_service.dart';
import 'package:wakoody/services/location_service.dart';
import 'package:wakoody/utils/location_dialog.dart';
import 'package:wakoody/utils/locator.dart';
import 'package:wakoody/utils/mac_address.dart';
import 'package:wakoody/utils/resources/assets_manager.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/routes_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';
import 'package:wakoody/viewmodel/register_viewmodel.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends ConsumerState<RegisterView> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterViewModel? registerViewModel;
  RegisterRequestModel? requestModel = RegisterRequestModel();

  // = RegisterViewModel( RegisterDataRepositoryImp())  ;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registerViewModel = ref.read(registerProvider);
      ref.watch(registerProvider).preferences;
      registerViewModel?.loadImage();
    });
    // ref.read(deviceMacAddressProvider).initPlatformState();
    super.initState();
  }

  signUp() async {
    Position? myPosition = ref.watch(locationProvider).currentPosition;
    // = locator<RegisterRequestModel>();

    String customerName = customerNameController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String? lat = myPosition?.latitude.toString();
    String? lng = myPosition?.longitude.toString();

    if (email.contains('@')) {
      requestModel?.email = email;
    } else {
      requestModel?.phoneNumber = email;
    }
    requestModel?.latitude = lat;
    requestModel?.longitude = lng;
    requestModel?.name = customerName;
    requestModel?.password = password;

    if (password != confirmPassword) {
      Fluttertoast.showToast(
          msg: AppStrings.passwordsNotEqual.tr(),
          toastLength: Toast.LENGTH_LONG);
      return;
    }
    if (password.length < 6 || confirmPassword.length < 6) {
      Fluttertoast.showToast(
          msg: AppStrings.passwordLength.tr(), toastLength: Toast.LENGTH_LONG);
      return;
    }

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        customerName.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        locationController.text.isNotEmpty) {
      try {
        await registerViewModel?.register(requestModel!).then((responseModel) {
        //  print('// response : ${responseModel?.message}');
          if (responseModel?.data != null) {
            Fluttertoast.showToast(
                msg: 'success ', toastLength: Toast.LENGTH_LONG);
            Navigator.pushReplacementNamed(context, Routes.otpRoute);
          }
         /* if (responseModel?.error != null) {
            Fluttertoast.showToast(
                msg: '${responseModel?.error?.message}',
                toastLength: Toast.LENGTH_LONG);
          }*/
        });
      } catch (e) {
        Fluttertoast.showToast(
            msg: 'time out ', toastLength: Toast.LENGTH_LONG);
      }
    } else {
      Fluttertoast.showToast(
          msg: AppStrings.requiredEmptyFields.tr(),
          toastLength: Toast.LENGTH_LONG);
      return;
    }
  } // end signUp()

  @override
  Widget build(BuildContext context) {
    var imageProvider = ref.read(registerProvider);
    File? image = ref.watch(registerProvider).image;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .1),
                  Text(
                    AppStrings.signUp,
                    style: Theme.of(context).textTheme.headline1,
                  ).tr(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                    child: Divider(
                      thickness: AppSize.s8,
                      color: ColorManager.primary,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  Text(
                    AppStrings.signUpWelcomeText.tr(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        imageProvider.imagePath != null
                            ? Container(
                          margin: const EdgeInsets.only(
                              top: AppMargin.m50),
                          child: CircleAvatar(
                            radius: AppSize.s70,
                            backgroundImage: FileImage(
                                File(imageProvider.imagePath ?? '')),
                          ),
                        )
                            : Container(
                          width: AppSize.s120,
                          height: AppSize.s120,
                          // color: ColorManager.primary,
                          margin: const EdgeInsets.only(
                              top: AppMargin.m20),
                          child: CircleAvatar(
                            radius: AppSize.s70,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(AppSize.s70),
                              child: image == null
                                  ? const Image(
                                image: AssetImage(
                                    ImageAssets.splashLogo),
                                width: AppSize.s120,
                                height: AppSize.s120,
                                fit: BoxFit.contain,
                              )
                                  : Image.file(
                                image,
                                width: AppSize.s120,
                                height: AppSize.s120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: AppSize.s40,
                          height: AppSize.s40,
                          //  color: Colors.black,
                          margin: const EdgeInsets.only(
                              left: AppMargin.m100, top: AppMargin.m100),
                          child: CircleAvatar(
                            backgroundColor: ColorManager.primary,
                            radius: AppSize.s70,
                            child: ClipRRect(
                              child: IconButton(
                                padding: const EdgeInsets.only(
                                  /*bottom: AppPadding.p50 ,*/
                                    top: AppPadding.p3),
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: AppSize.s30,
                                  color: ColorManager.white,
                                ),
                                onPressed: () async {
                                  _showPicker(
                                      context, imageProvider, image);
                                  ref.watch(registerProvider).preferences;
                                  registerViewModel?.loadImage();
                                },
                              ),
                            ),
                          ),
                          /* OutlinedButton.icon(
                            icon: Icon(Icons.camera_alt ,
                              size: AppSize.s50,
                              color: ColorManager.white,),
                            onPressed: (){},
                            label: Text(''),
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.0))
                            )
                        ),*/
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: AppMargin.m25, bottom: AppMargin.m20),
                    child: TextField(
                      controller: customerNameController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.book_online),
                          hintText: AppStrings.customerNameHint.tr(),
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: AppMargin.m20),
                    child: TextField(
                      controller: emailController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail),
                          hintText: AppStrings.emailHint.tr(),
                          disabledBorder: InputBorder.none),
                    ),
                  ),
                  Consumer(
                    builder: (ctx, ref, child) {
                      String? myAddress =
                          ref.watch(locationProvider).currentAddress;
                      locationController.text = myAddress ?? '';
                      return Container(
                        margin:
                        const EdgeInsets.only(bottom: AppMargin.m20),
                        child: TextField(
                          controller: locationController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            hintText: AppStrings.locationHint.tr(),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.my_location),
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return openLocationDialog(context);
                                    });
                              },
                            ),
                            // const Icon(Icons.my_location)
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: AppMargin.m20),
                    child: TextField(
                      controller: passwordController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: AppStrings.password.tr(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: AppMargin.m20),
                    child: TextField(
                      controller: confirmPasswordController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: AppStrings.confirmPassword.tr(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: AppSize.s160,
                          height: AppSize.s50,
                          margin:
                          const EdgeInsets.only(bottom: AppMargin.m20),
                          child: ElevatedButton(
                            onPressed: () async {
                              await signUp();
                              print('mokh correct');
                            },
                            style:
                            Theme.of(context).elevatedButtonTheme.style,
                            child: Text(AppStrings.signUp.tr()),
                          ),
                        ),
                        Text(
                          AppStrings.haveAccount.tr(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: Theme.of(context).textButtonTheme.style,
                          child: Text(AppStrings.signIn.tr()),
                        )
                      ],
                    ),
                  ),
                ],
              ),),
        ),
      ),
    );
  }

  void _showPicker(context, imageProvider, image) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading:
                        Icon(Icons.photo_library, color: ColorManager.primary),
                    title: Text(AppStrings.photoGalley.tr()),
                    onTap: () async {
                      await imageProvider.imgFromGallery();
                      Navigator.of(context).pop();
                      imageProvider.saveImage(image?.path);
                      ref.watch(registerProvider).preferences;
                      registerViewModel?.loadImage();
                    }),
                ListTile(
                  leading:
                      Icon(Icons.photo_camera, color: ColorManager.primary),
                  title: Text(AppStrings.photoCamera.tr()),
                  onTap: () async {
                    await imageProvider.imgFromCamera();
                    Navigator.of(context).pop();
                    imageProvider.saveImage(image?.path);
                    ref.watch(registerProvider).preferences;
                    registerViewModel?.loadImage();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo, color: ColorManager.primary),
                  title: Text(AppStrings.viewPhoto.tr()),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ));
        });
  } // end _showPicker()

  @override
  void dispose() {
    locationController.dispose();
    customerNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
