import 'package:connectivity/connectivity.dart';

class Connection {
  static final Connection instance= new Connection();
  Future<bool> CheckConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else
      return false;
  }

  Connection();
}
