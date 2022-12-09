import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/language_manager.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorManager.white
  ));

  runApp(
       ProviderScope(
         child: EasyLocalization(
           path: ASSETS_PATH_LOCALISATIONS,
           supportedLocales: const [ENGLISH_LOCAL , ARABIC_LOCAL],
           fallbackLocale:  ENGLISH_LOCAL,
           child: Phoenix(
               child: MyApp()
           ),
         ),
       )
  );
}