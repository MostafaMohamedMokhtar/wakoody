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
  String dropdownvalue1 = 'Riyadh';
  String dropdownvalue2 = 'Al-Kharj';

  // List of items in our dropdown menu
  var cities = [
    'Riyadh',
    'Al-Kharj',
    'Al-Dammam',
    'Jeddah',
    'Makkah',
  ];

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
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  padding: const EdgeInsets.all(AppPadding.p8),
                //  color: Colors.yellow,
                  child: DropdownButton(
                    isExpanded: true,

                    // Initial Value
                    value: dropdownvalue1,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: cities.map((String city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue1 = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: AppSize.s30,),
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                 padding: const EdgeInsets.all(AppPadding.p8),
                //  color: Colors.lightBlue,
                  child: DropdownButton(
                    isExpanded: true,
                    // Initial Value
                    value: dropdownvalue2,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: cities.map((String city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue2 = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s15,),
            Text(AppStrings.transportDate.tr() ,
              style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
    );
  }
}
