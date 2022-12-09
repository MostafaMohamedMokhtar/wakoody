import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/services/location_service.dart';
import 'package:wakoody/utils/location_dialog.dart';
import 'package:wakoody/utils/resources/assets_manager.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';

class RegisterView extends StatefulWidget {
   RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height *.1
                ),
                Text(
                  AppStrings.signUp ,
                  style: Theme.of(context).textTheme.headline1,
                ).tr(),
                SizedBox(
                  width: MediaQuery.of(context).size.width *.15,
                  child:  Divider(
                    thickness: AppSize.s8,
                    color: ColorManager.primary,
                  ),
                ),
                const SizedBox(height: AppSize.s40,),
                Text(
                  AppStrings.signUpWelcomeText.tr() ,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: AppSize.s120,
                        height: AppSize.s120,
                       // color: ColorManager.primary,
                        margin: const EdgeInsets.only(top: AppMargin.m20 ) ,
                        child: const CircleAvatar(
                          radius: AppSize.s70,
                          child: ClipRRect(
                           child:  Image(
                             image: AssetImage(ImageAssets.splashLogo),
                             width: AppSize.s120,
                             height: AppSize.s120,
                           ),
                          ),
                        ),
                      ),
                      Container(
                        width: AppSize.s40,
                        height: AppSize.s40,
                      //  color: Colors.black,
                        margin: const EdgeInsets.only(left: AppMargin.m100, top: AppMargin.m100),
                        child: CircleAvatar(
                          backgroundColor: ColorManager.primary ,
                          radius: AppSize.s70,
                          child: ClipRRect(
                            child: IconButton(
                              padding: const EdgeInsets.only(/*bottom: AppPadding.p50 ,*/ top:AppPadding.p3 ),
                              icon: Icon(
                                Icons.camera_alt,
                                size: AppSize.s30,
                                color: ColorManager.white,
                              ),
                              onPressed: (){
                              //  _showPicker(context);
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
                  margin: const EdgeInsets.only(top: AppMargin.m25, bottom: AppMargin.m20),
                  child:   TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.book_online),
                        hintText: AppStrings.customerNameHint.tr() ,
                        disabledBorder: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only( bottom: AppMargin.m20),
                  child:   TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail),
                        hintText: AppStrings.emailHint.tr() ,
                        disabledBorder: InputBorder.none
                    ),
                  ),
                ),
                Consumer(
                  builder: (ctx , ref , child){
                    String? myAddress = ref.watch(locationProvider).currentAddress;
                    locationController.text = myAddress?? '' ;
                    return Container(
                      margin: const EdgeInsets.only(bottom: AppMargin.m20),
                      child:  TextField(
                        controller: locationController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on),
                          hintText: AppStrings.locationHint.tr() ,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.my_location),
                            onPressed: ()async{
                              showDialog(
                                  barrierDismissible: false ,
                                  context: context,
                                  builder: (context){
                                    return openLocationDialog(context);
                                  }
                              );
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
                  child:  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: AppStrings.password.tr() ,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: AppMargin.m20),
                  child:  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: AppStrings.confirmPassword.tr() ,
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s20,),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: AppSize.s160,
                        height: AppSize.s50,
                        margin: const EdgeInsets.only(bottom: AppMargin.m20),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text(AppStrings.signUp.tr()),
                        ),
                      ),
                      Text(
                        AppStrings.haveAccount.tr(),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        style: Theme.of(context).textButtonTheme.style,
                        child: Text(AppStrings.signIn.tr()) ,
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }
}
