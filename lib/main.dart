import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wakoody/utils/resources/language_manager.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
       EasyLocalization(
         path: ASSETS_PATH_LOCALISATIONS,
         supportedLocales: const [ENGLISH_LOCAL , ARABIC_LOCAL],
         fallbackLocale:  ENGLISH_LOCAL,
         child: Phoenix(
             child: MyApp()
         ),
       )
  );
}