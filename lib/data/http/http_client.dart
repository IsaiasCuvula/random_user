abstract class UserHttpClient {
  Future<dynamic> request({
    required String url,
    Map? body,
    Map<String, String>? header,
  });
}
