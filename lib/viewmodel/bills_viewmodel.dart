import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakoody/view/bills/body_panels/done_panel.dart';
import 'package:wakoody/view/bills/body_panels/inprogress_panel.dart';
import 'package:wakoody/view/bills/body_panels/pending_panel.dart';

final billsProvider = ChangeNotifierProvider<BillsViewModel>((ref) {

  return BillsViewModel();
});

class BillsViewModel extends ChangeNotifier{

  int _index = 0 ;

  set setIndex(int index){
    _index = index ;
    notifyListeners();
  }

  int get getIndex{
    notifyListeners();
    return _index ;
  }

  changeBodyPanel(){
    switch(_index){
      case 0 :
        return const DonePanel();
      case 1 :
        return const InProgressPanel();
      case 2 :
        return const PendingPanel();
    }
  } // end changeBodyPanel()

}