import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mac_address/mac_address.dart';

final deviceMacAddressProvider = ChangeNotifierProvider<DeviceMacAddress>((ref) {

  return DeviceMacAddress();
});

class DeviceMacAddress extends ChangeNotifier{
  String? platformVersion;

  Future<void> initPlatformState() async {
    try {
      platformVersion = await GetMac.macAddress;
      print('macAddress: $platformVersion');
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }
    notifyListeners() ;
  } // end initPlatformState()
} // end class