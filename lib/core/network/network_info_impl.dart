import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:random_user/core/core.dart';

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => _isConnected();

  Future<bool> _isConnected() async {
    final connectivity = await Connectivity().checkConnectivity();
    return connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi ||
        connectivity == ConnectivityResult.ethernet;
  }
}
