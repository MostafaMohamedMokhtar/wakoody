import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wakoody/services/location_service.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/routes_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/styles_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

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
                      Container(
                        width: AppSize.s160,
                        height: AppSize.s50,
                        margin: const EdgeInsets.only(bottom: AppMargin.m40),
                        child: ElevatedButton(
                          onPressed: (){

                          },
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text(AppStrings.signIn.tr()),
                        ),
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
}
