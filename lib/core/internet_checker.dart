import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  static Connectivity connectivity = Connectivity();

  static Future<bool> checkNetwork() async {
    List<ConnectivityResult> connections = await connectivity.checkConnectivity();
    if (connections.contains(ConnectivityResult.mobile )||
        connections.contains(ConnectivityResult.wifi)) {
    return true ;
      // Mobile network available.
    }else{
      return false;
    }
  }
}