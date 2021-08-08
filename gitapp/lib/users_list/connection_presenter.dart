import 'package:connectivity/connectivity.dart';

class Connection {
  static final Connection instance = new Connection();
  Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else
      return false;
  }
  Connection();
}
