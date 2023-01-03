import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/routes_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';
import 'package:wakoody/view/bills/body_panels/done_panel.dart';
import 'package:wakoody/view/bills/body_panels/inprogress_panel.dart';
import 'package:wakoody/view/bills/body_panels/pending_panel.dart';
import 'package:wakoody/viewmodel/bills_viewmodel.dart';

class BillsView extends StatefulWidget {
  const BillsView({Key? key}) : super(key: key);

  @override
  State<BillsView> createState() => _BillsViewState();
}

class _BillsViewState extends State<BillsView> {
 // int index = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(

        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: ColorManager.primary,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),

        title: Container(
          alignment: Alignment.centerLeft,
          child: Text('${AppStrings.hello.tr()} , ' ,
        style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
      ),*/
      body: Consumer(
        builder: (ctx , ref , child){
          var billProvider = ref.watch(billsProvider);
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, AppSize.s140),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        /// left container for name and title
                        Flexible(
                          flex: 3,
                          child: Container(
                            // color: Colors.lightBlue,
                              margin: const EdgeInsets.only(
                                  left: AppMargin.m20,
                                  right: AppMargin.m8,
                                  top: AppMargin.m50),
                              width: MediaQuery.of(context).size.width * .65,
                              height: MediaQuery.of(context).size.height * .1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${AppStrings.hello.tr()} , Mostafa',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    'Monday , 12 September 2022',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .15,
                                    child: Divider(
                                      thickness: AppSize.s8,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ],
                              )),
                        ),

                        /// right container of icons
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: AppMargin.m10, top: AppMargin.m50),
                            //  color: Colors.amberAccent,
                            width: MediaQuery.of(context).size.width * .30,
                            height: MediaQuery.of(context).size.height * .1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: ColorManager.white,
                                  size: AppSize.s30,
                                ),
                                Icon(
                                  Icons.notifications_rounded,
                                  color: ColorManager.white,
                                  size: AppSize.s30,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: MediaQuery.of(context).size.height * .06,
                        margin: const EdgeInsets.only(top: AppMargin.m20),
                        decoration: BoxDecoration(
                            color: ColorManager.pink,
                            borderRadius: BorderRadius.circular(AppSize.s15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .25,
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius: BorderRadius.circular(AppSize.s15),
                                border: Border.all(
                                    color: ColorManager.white, width: AppSize.s1_5),
                              ),
                              child: TextButton(
                                child: Text(AppStrings.done.tr(),
                                    style: Theme.of(context).textTheme.bodyText2),
                                onPressed: () {
                                  /* setState(() {
                                index = 0 ;
                              });*/
                                  billProvider.setIndex = 0 ;
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .25,
                              // color: Colors.red,
                              child: TextButton(
                                child: Text(
                                  AppStrings.inProgress.tr(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                onPressed: () {
                                  billProvider.setIndex = 1 ;
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .25,
                              //  color: Colors.black,
                              child: TextButton(
                                child: Text(AppStrings.pending.tr(),
                                    style: Theme.of(context).textTheme.bodyText2),
                                onPressed: () {
                                  /*setState(() {
                                    index = 2 ;
                                  });*/
                                  billProvider.setIndex = 2 ;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// container for textField search
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .08,
                margin: const EdgeInsets.only(top: AppMargin.m20 ,/* bottom: AppMargin.m20*/),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p15, vertical: AppPadding.p2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  // color: Colors.black
                ),
                child: Card(
                  shadowColor: ColorManager.grey7,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                  child: TextField(
                    // controller: _emailController,
                    //  cursorColor: ColorManager.primary,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        width: MediaQuery.of(context).size.width * .13,
                        margin: const EdgeInsets.only(
                            bottom: AppMargin.m2,
                            left: AppMargin.m8,
                            right: AppMargin.m8,
                            top: AppMargin.m4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          color: ColorManager.primary,
                        ),
                        child: Icon(
                          Icons.search,
                          color: ColorManager.white,
                        ),
                      ),
                      hintText: AppStrings.search.tr(),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              billProvider.changeBodyPanel()
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .09,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s15),
                  topRight: Radius.circular(AppSize.s15)),
            ),
            child: Text(
              AppStrings.createNewOrder.tr(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }

}
