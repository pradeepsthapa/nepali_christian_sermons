import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityState extends StateNotifier<ConnectivityResult?>{

  ConnectivityState() : super(null){
        Connectivity().onConnectivityChanged.listen((event) {
          state = event;
      // _updateConnectionStatus(event);
    });
  }

  // void _updateConnectionStatus(ConnectivityResult result) {
  //   state = result;
  //   switch (result) {
  //     case ConnectivityResult.wifi:
  //       state = ConnectivityResult.wifi;
  //       print("wifi connected");
  //       break;
  //     case ConnectivityResult.mobile:
  //       state = ConnectivityResult.mobile;
  //       break;
  //     case ConnectivityResult.none:
  //       print("no internet connection");
  //       state = ConnectivityResult.none;
  //       break;
  //     default:
  //       break;
  //   }
  // }
}