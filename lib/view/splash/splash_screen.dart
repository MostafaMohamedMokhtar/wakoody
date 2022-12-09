import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakoody/utils/resources/assets_manager.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/routes_manager.dart';

import '../../app/app_prefs.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
 // AppPreferences _appPreferences = instance<AppPreferences>();
  late AppPreferences _appPreferences ;

  @override
  void didChangeDependencies() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    _appPreferences = AppPreferences(sharedPrefs);

    super.didChangeDependencies();
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          (isUserLoggedIn) ?
          Navigator.pushReplacementNamed(context, Routes.mainRoute)
              : Navigator.pushReplacementNamed(context, Routes.loginRoute)
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
