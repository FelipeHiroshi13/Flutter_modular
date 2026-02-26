import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.isEmpty) {
      return false;
    }
    return connectivityResults.any((r) => r != ConnectivityResult.none);
  }
}
