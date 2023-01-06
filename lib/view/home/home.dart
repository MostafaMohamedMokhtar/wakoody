import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wakoody/utils/resources/assets_manager.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/routes_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.home.tr()),
        titleTextStyle: Theme.of(context).textTheme.bodyText2,
      ) ,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: AppMargin.m30 , right: AppMargin.m10 , left: AppMargin.m10 ),
        child: GridView.count(
          crossAxisCount: 2 ,
          childAspectRatio: 5/6,
          shrinkWrap: true,
          mainAxisSpacing: AppSize.s10,
          crossAxisSpacing: AppSize.s10,
          children: [
            gridItem(ImageAssets.cargo, AppStrings.cargo.tr() , context , Routes.cargoRoute),
            gridItem(ImageAssets.logistics, AppStrings.logistics.tr() , context , Routes.logisticsRoute),
            gridItem(ImageAssets.tow, AppStrings.tow.tr() , context , Routes.towRoute),
          ],
        ),
      ),
    );
  }

  Widget gridItem(String imageName , String serviceName , BuildContext context ,String? routeName ){
    return InkWell(
      onTap: routeName == null ? (){}
          : (){
        Navigator.of(context).pushNamed(routeName);
      } ,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p4 ),
        decoration: BoxDecoration(
         // color: ColorManager.grey7,
          borderRadius: BorderRadius.circular(AppSize.s15)
        ),
        child: Card(
          shadowColor: ColorManager.grey7,
          elevation: AppSize.s4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage(imageName),
                height: MediaQuery.of(context).size.height * .18,
                width: MediaQuery.of(context).size.width ,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: AppSize.s15,) ,
              Text(serviceName ,
              style: Theme.of(context).textTheme.subtitle2,)
            ],
          ),
        ),
      ),
    );
  }
}
