import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wakoody/model/login/login_request_model.dart';
import 'package:wakoody/network/login_service.dart';
import 'package:wakoody/services/location_service.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/routes_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/styles_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/viewmodel/login_viewmodel.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _emailOrPhoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  LoginRequestModel? loginRequestModel = LoginRequestModel() ;

  Future<void> signIn(WidgetRef ref) async{
    String emailOrPhone = _emailOrPhoneController.text.trim() ;
    String password = _passwordController.text.trim();
    loginRequestModel?.phoneNumber = emailOrPhone ;
    loginRequestModel?.email = emailOrPhone ;
    loginRequestModel?.password = password ;
    loginRequestModel?.deviceMacAddress = 'l0:f2:8c:zf:m3:0y' ;

    if(emailOrPhone.isNotEmpty && password.isNotEmpty){
      try {
        String? code ;
        LoginViewModel loginViewModel =  ref.read(loginProvider) ;
        loginViewModel.login(loginRequestModel).then((responseModel){
          code = responseModel?.code ;
          print('code: $code');

          if(code == '200' ){
            Fluttertoast.showToast(msg: 'success ' , toastLength: Toast.LENGTH_LONG);
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          }
          else {
            Fluttertoast.showToast(msg: 'wrong credentials ',
                toastLength: Toast.LENGTH_LONG);
          }
        } );

      } catch(e){
        Fluttertoast.showToast(msg: 'UnAuthorised ' , toastLength: Toast.LENGTH_LONG);
      }
    }
    else{
      Fluttertoast.showToast(msg: 'required empty field' , toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
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
                    height: MediaQuery.of(context).size.height *.15
                ),
                 Text(
                    AppStrings.signIn ,
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
                    AppStrings.signInWelcomeText.tr() ,
                    style: Theme.of(context).textTheme.subtitle1,
                ),
                 Container(
                   margin: const EdgeInsets.only(top: AppMargin.m30),
                  child:   TextField(
                    controller: _emailOrPhoneController,
                  //  cursorColor: ColorManager.primary,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      hintText: AppStrings.emailOrPhone.tr() ,
                      disabledBorder: InputBorder.none
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s40,),
                Container(
                  margin: const EdgeInsets.symmetric( vertical: AppMargin.m14),
                  child:  TextField(
                    controller: _passwordController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: AppStrings.password.tr() ,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                        AppStrings.forgetPassword.tr(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                ) ,
               const  SizedBox(height: AppSize.s90),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Consumer(
                       builder: (_ , ref , child){
                         return  Container(
                           width: AppSize.s160,
                           height: AppSize.s50,
                           margin: const EdgeInsets.only(bottom: AppMargin.m40),
                           child: ElevatedButton(
                             onPressed: ()async{
                               signIn(ref) ;
                             },
                             style: Theme.of(context).elevatedButtonTheme.style,
                             child: Text(AppStrings.signIn.tr()),
                           ),
                         );
                       },
                     ),
                       Text(
                         AppStrings.dontHaveAnAccount.tr(),
                         style: Theme.of(context).textTheme.headline2,
                       ),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                        style: Theme.of(context).textButtonTheme.style,
                          child: Text(AppStrings.signUp.tr()) ,
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
    _passwordController.dispose() ;
    _emailOrPhoneController.dispose() ;
    super.dispose();
  }
}
