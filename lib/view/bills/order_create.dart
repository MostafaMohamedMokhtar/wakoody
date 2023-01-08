import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wakoody/utils/date_piacker.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';

class OrderCreateView extends StatefulWidget {
  const OrderCreateView({Key? key}) : super(key: key);

  @override
  State<OrderCreateView> createState() => _OrderCreateViewState();
}

class _OrderCreateViewState extends State<OrderCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.carTransport.tr()),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(left: AppMargin.m14 , right:AppMargin.m14 , top: AppMargin.m30 ),
       /* decoration: const BoxDecoration(
          color: Colors.yellow
        ),*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.transportDate.tr() ,
              style: Theme.of(context).textTheme.headline4,),
            MyTextFieldDatePicker(
              labelText: "Date",
              prefixIcon: const Icon(Icons.date_range),
              suffixIcon: const Icon(Icons.arrow_drop_down),
              lastDate: DateTime.now().add(const Duration(days: 366)),
              firstDate: DateTime.now(),
              initialDate: DateTime.now().add(const Duration(days: 1)),
              onDateChanged: (selectedDate) {
                // Do something with the selected date
              },
              focusNode: FocusNode(),
            )
          ],
        ),
      ),
    );
  }
}
