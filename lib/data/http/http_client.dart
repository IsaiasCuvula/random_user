abstract class UserHttpClient {
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map<String, String>? header,
  });
}
