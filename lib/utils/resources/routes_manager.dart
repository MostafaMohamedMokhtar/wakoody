
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/view/bills/bill_details.dart';
import 'package:wakoody/view/bills/bills.dart';
import 'package:wakoody/view/login/login_screen.dart';
import 'package:wakoody/view/otp/otp_screen.dart';
import 'package:wakoody/view/register/register_screen.dart';
import 'package:wakoody/view/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String otpRoute = "/otpRoute";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String billsRoute = "/bills";
  static const String billDetailsRoute = "/billDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
       // initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
       // initRegisterModule();
        return MaterialPageRoute(builder: (_) =>  const RegisterView());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpView());
      case Routes.billsRoute:
       // initRegisterModule();
        return MaterialPageRoute(builder: (_) => const BillsView());
      case Routes.billDetailsRoute:
        return MaterialPageRoute(builder: (_) => const BillDetailsView());
   /*   case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        initStoreDetailsModule();
        return MaterialPageRoute(builder: (_) => StoreDetailsView());*/
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound).tr(),
              ),
              body: Center(child: const Text(AppStrings.noRouteFound).tr()),
            ));
  }
}
