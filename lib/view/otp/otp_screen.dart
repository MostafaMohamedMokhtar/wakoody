import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
        ]
          ),
        ),
      ),
    );
  }
}
