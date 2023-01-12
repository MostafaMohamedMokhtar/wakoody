import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wakoody/utils/date_piacker.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
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
  String carTypeDropDown = 'Honda';
  String carsCategoriesDropDown = 'Honda1';
  String? car = 'one car' ;

  // List of items in our dropdown menu
  var cities = [
    'Riyadh',
    'Al-Kharj',
    'Al-Dammam',
    'Jeddah',
    'Makkah',
  ];

  var cars = [
    'Honda',
    'BMW',
    'Mercedes',
    'KIA',
    'Hyundai',
  ];
  var carModels = [
    'Honda1',
    'Honda2',
    'Honda3',
    'Honda4',
    'Honda5',
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
            const SizedBox(height: AppSize.s15,),
            RadioListTile(
                activeColor: ColorManager.primary,
                title: Text(AppStrings.oneCar.tr()),
                value: 'one car',
                groupValue: car,
                onChanged: (value){
                  setState(() {
                    car = value.toString() ;
                  });
                }
            ),
            /// cars types
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(AppPadding.p8),
              //  color: Colors.lightBlue,
              child: DropdownButton(
                isExpanded: true,
                // Initial Value
                value: carTypeDropDown,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: cars.map((String car) {
                  return DropdownMenuItem(
                    value: car,
                    child: Text(car),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    carTypeDropDown = newValue!;
                  });
                },
              ),
            ),
            /// car categories
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(AppPadding.p8),
              //  color: Colors.lightBlue,
              child: DropdownButton(
                isExpanded: true,
                // Initial Value
                value: carsCategoriesDropDown,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: carModels.map((String model) {
                  return DropdownMenuItem(
                    value: model,
                    child: Text(model),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    carsCategoriesDropDown = newValue!;
                  });
                },
              ),
            ),
            RadioListTile(
                activeColor: ColorManager.primary,
                title: Text(AppStrings.carsGroup.tr()),
                value: 'cars group',
                groupValue: car,
                onChanged: (value){
                  setState(() {
                    car = value.toString() ;
                  });
                }
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: AppSize.s50,
              margin: const EdgeInsets.only(top: AppMargin.m40 , right: AppMargin.m20 , left: AppMargin.m20),
              child: ElevatedButton(
                onPressed: ()async{
                //  Navigator.pushNamed(context, Routes.homeRoute);
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(AppStrings.search.tr()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
