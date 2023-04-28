import 'dart:convert';
import 'package:random_user/domain/domain.dart';
import 'http_client.dart';
import 'package:http/http.dart' as http;

class UserHttpClientImpl implements UserHttpClient {
  final http.Client client;

  UserHttpClientImpl({required this.client});

  @override
  Future request({required String url, Map? body, Map? header}) async {
    final Map<String, String> defaultHeaders =
        header?.cast<String, String>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
          });
    final response = await http.get(
      Uri.parse(url),
      headers: defaultHeaders,
    );
    return _handleRespose(response);
  }

  dynamic _handleRespose(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }
}
