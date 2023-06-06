import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/core/core.dart';

final networkInfoProvider = Provider.autoDispose<NetworkInfo>((ref) {
  final connectivity = Connectivity();
  return NetworkInfoImpl(connectivity: connectivity);
});
