
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakoody/app/app_prefs.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // AppPreferences _appPreferences = instance<AppPreferences>();

  late AppPreferences _appPreferences ;

  @override
  void didChangeDependencies() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    _appPreferences = AppPreferences(sharedPrefs);
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: Routes.splashRoute,
      // theme: getApplicationTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.skip).tr(),
        ),
        body: Container() ,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _appPreferences.changeAppLanguage();
            Phoenix.rebirth(context);
          },
          child: const Icon(Icons.language),
        ),
      ),
    );
  }
}
