import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/routes_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';

class InProgressPanel extends StatelessWidget {
  const InProgressPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.tealAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .48,
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p15),
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (ctx , index){
              return GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'pressed' , toastLength : Toast.LENGTH_LONG);
                  Navigator.pushNamed(context, Routes.billDetailsRoute);
                },
                child: Card(
                  //  color: ColorManager.primary,
                  shadowColor: ColorManager.grey7,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ahmed' , style: Theme.of(context).textTheme.subtitle1,),
                            Text('#0123456789' , style: Theme.of(context).textTheme.subtitle2,)
                          ],
                        ),
                        Text('1-10-2022' ,
                          style: Theme.of(context).textTheme.headline5,),
                        Text('the quick brown for jumps over a lazy dog  , DJs flack by when MTV or quiz prog' ,
                          style: Theme.of(context).textTheme.caption,),
                      ],
                    ),
                  ),
                ),
              ) ;

              /* ListTile(
                      onTap: (){},
                      title: Text('WayBills' , style: Theme.of(context).textTheme.subtitle1,),
                      subtitle: const Text('22-9-2022'),
                      leading: const Text('the quick brown for jumps over a lazy dog  , DJs flack by when MTV or quiz prog'),
                    );*/
            }
        ),
      ),
    );
  }
}