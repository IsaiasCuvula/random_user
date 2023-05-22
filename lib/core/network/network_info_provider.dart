import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/core/core.dart';

final networkInfoProvider = Provider.autoDispose<NetworkInfo>((ref) {
  return NetworkInfoImpl();
});
