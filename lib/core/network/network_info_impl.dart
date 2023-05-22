import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:random_user/core/core.dart';

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => _isConnected();

  Future<bool> _isConnected() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.mobile) {
      return true;
    } else if (connectivity == ConnectivityResult.wifi) {
      return true;
    } else if (connectivity == ConnectivityResult.ethernet) {
      return true;
    } else {
      return false;
    }
  }
}
