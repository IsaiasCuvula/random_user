import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:random_user/features/random_user/random_user.dart';

final httpClientProvider = Provider.autoDispose<UserHttpClient>((ref) {
  final client = http.Client();
  return UserHttpClientImpl(client: client);
});
