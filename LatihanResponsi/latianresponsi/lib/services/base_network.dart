import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latianresponsi/model/user_model.dart';

class BaseNetwork {
  static final String baseUrl = "https://api.github.com/";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }
  static Future<List<UsersModel>> getRepos(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse2(response);
  }
  static Future<List<UsersModel>> _processResponse2(
      http.Response response) async {
    final body = response.body;
    final jsonBody = json.decode(body);
    return jsonBody.map((p) => UsersModel.fromJson(p))
        .toList();
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}
