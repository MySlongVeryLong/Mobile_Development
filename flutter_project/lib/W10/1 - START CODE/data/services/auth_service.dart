import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/auth_session.dart';
import '../../model/user.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "login");

    // 1- Create the JSON body with the name and password

    Map<String, dynamic> jsonData = {'name': name, 'password': password};

    // 2- Fetch the POST/login

    final response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jsonData),
    );

    // 3- Decode the json

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    // 4 - If failed, throw a AuthException

    if (response.statusCode != 200) {
      throw AuthException("Login failed: ${jsonResponse['error']}");
    }

    // 5 -  Get the token

    String token = jsonResponse['token'];

    // 5 -  Get the user

    User user = User.fromJSon(jsonResponse['user']);

    // 6 - Update the session

    session = AuthSession(token: token, user: user);
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}
