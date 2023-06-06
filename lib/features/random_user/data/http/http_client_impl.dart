import 'dart:convert';
import 'package:random_user/core/error/exceptions.dart';
import 'package:random_user/features/random_user/random_user.dart';
import 'package:http/http.dart' as http;

class UserHttpClientImpl implements UserHttpClient {
  final http.Client client;

  UserHttpClientImpl({required this.client});

  @override
  Future<dynamic> request({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool isListRequest = false,
  }) async {
    final Map<String, String> defaultHeaders =
        headers?.cast<String, String>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
          });
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: defaultHeaders,
      );
      return _handleRespose(response, isListRequest: isListRequest);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> _handleRespose(http.Response response,
      {bool isListRequest = false}) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonData = jsonDecode(response.body);
      try {
        if (isListRequest) {
          return UserMapper.fromJsonList(jsonData);
        } else {
          return UserMapper.fromJson(jsonData);
        }
      } catch (e) {
        throw ParsingJsonException();
      }
    } else {
      throw ServerException();
    }
  }
}
