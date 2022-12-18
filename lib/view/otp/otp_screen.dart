import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/font_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';
import 'package:pinput/pinput.dart';
import 'package:wakoody/viewmodel/otp_viewmodel.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _pinPutController = TextEditingController();
  final focusNode = FocusNode();
 // bool isFinished = false ;

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
                  SizedBox(height: MediaQuery.of(context).size.height * .1),
                  Text(
                    AppStrings.verification,
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
                    AppStrings.otpWelcomeText.tr(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Center(child: Consumer(builder: (_, ref, child) {
                   bool isFinished = ref.read(otpProvider).getTime ;
                    return Column(
                      children: [
                        animatedBorders(),
                        TweenAnimationBuilder(
                         //  key: ValueKey(questionId),
                          tween: Tween(begin: AppTimer.t30, end: AppTimer.t0),
                          duration: const Duration(seconds: AppTimer.t30s),
                          builder: (context, double value, child) => Text(
                            "00:${value.toInt()}",
                            style: (!isFinished)
                                ?Theme.of(context).textTheme.subtitle2
                            :Theme.of(context).textTheme.headline5,
                          ),
                          onEnd: (){
                             /*setState(() {
                               isFinished = true ;
                             });*/
                             ref.watch(otpProvider).setTime = true ;
                          },
                        ),
                        TextButton(
                            onPressed: (isFinished) ?() {
                               ref.watch(otpProvider).setTime = false ;
                             /* setState(() {
                                isFinished = false ;
                              });*/
                            }:null,
                            child: Text(
                              AppStrings.resendOtp.tr(),
                              style: (!isFinished) ? Theme.of(context).textTheme.headline5
                              :Theme.of(context).textTheme.subtitle2 ,
                            ))
                      ],
                    );
                  })),
                ]),
          ),
        ),
      ),
    );
  } // end build()

  Widget animatedBorders() {
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: AppSize.s60,
      height: AppSize.s60,
      textStyle: TextStyle(fontSize: FontSize.s25, color: ColorManager.primary
          //Color.fromRGBO(30, 60, 87, 1),
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorManager.grey7),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m60, bottom: AppMargin.m30),
      child: Pinput(
        separator: const SizedBox(
          width: AppSize.s14,
        ),
        showCursor: true,
        onSubmitted: (String pin) {},
        autofillHints: const ['0', '0', '0', '0'],
        focusNode: focusNode,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        keyboardType: TextInputType.number,
        controller: _pinPutController,
        validator: (value) {
          return value == '2222' ? null : 'Pin is incorrect';
        },
        // onClipboardFound: (value) {
        //   debugPrint('onClipboardFound: $value');
        //   pinController.setText(value);
        // },
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          debugPrint('onCompleted: $pin');
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /// this for underline divider
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: AppSize.s22,
              height: AppSize.s1,
              color: ColorManager.grey7,
            ),
          ],
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ColorManager.grey7),
          ),
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorManager.grey7),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    focusNode.dispose();
    super.dispose();
  }
} // end class
