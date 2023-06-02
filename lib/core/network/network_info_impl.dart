import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:random_user/core/core.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);
  @override
  Future<bool> get isConnected => _isConnected();

  Future<bool> _isConnected() async {
    final connectivityCheck = await connectivity.checkConnectivity();
    return connectivityCheck == ConnectivityResult.mobile ||
        connectivityCheck == ConnectivityResult.wifi ||
        connectivityCheck == ConnectivityResult.ethernet;
  }
}
