import 'dart:convert';
import 'package:random_user/data/data.dart';
import 'package:random_user/domain/domain.dart';
import 'package:http/http.dart' as http;

class UserHttpClientImpl implements UserHttpClient {
  final http.Client client;

  UserHttpClientImpl({required this.client});

  @override
  Future<UserModel> request(
      {required String url, Map? body, Map? header}) async {
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

  Future<UserModel> _handleRespose(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData);
    } else {
      throw ServerException();
    }
  }
}
