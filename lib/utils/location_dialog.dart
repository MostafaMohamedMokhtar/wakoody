import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wakoody/services/location_service.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/services/location_service.dart';

Widget openLocationDialog(BuildContext context){
  return AlertDialog(
    title: const Icon(Icons.location_on),
    content: Text(AppStrings.accessLocation.tr()),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer(
            builder: (ctx , ref , child){
              return TextButton(
                  onPressed:()async{
                   await  ref.read(locationProvider).getCurrentPosition().then((value){
                     Navigator.of(context).pop();
                   });
                  },
                  child: Text(AppStrings.allow.tr())
              ) ;
            },
          ),
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text(AppStrings.deny.tr())
          ),
        ],
      )
    ],
  );
} // end openLocationDialog()

/*class LocationDialog extends StatelessWidget {
  const LocationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx){
          return openLocationDialog();
        }
    );
    return Container() ;
  }
}*/

