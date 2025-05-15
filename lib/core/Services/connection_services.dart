import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionServices {
  static Future<bool> checkConnection() async {
    final isConnected =
        await InternetConnectionChecker.createInstance().hasConnection;

    return isConnected;
    
  }
 
 
}
