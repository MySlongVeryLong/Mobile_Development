import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

enum UserRole { admin, student, teacher }

class User {
  final String name;
  final UserRole role;

  User({required this.name, required this.role});

  static User fromJson(Map<String, dynamic> json) {
    String name = json["name"];

    UserRole role = UserRole.values.firstWhere(
      (element) => element.name == json["role"],
    );
    return User(name: name, role: role);
  }
}

class AuthSession {
  final User user;
  final String token;
  final DateTime expiration;

  AuthSession({
    required this.user,
    required this.token,
    required this.expiration,
  });
}

void main() async {
  Uri loginUri = Uri.parse("http://localhost:8000/login");

  Map<String, dynamic> body = {"username": "ronan", "password": "thebest"};

  Response response = await http.post(
    loginUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body),
  );

  Map<String, dynamic> json = jsonDecode(response.body);

  if (response.statusCode == 200) {
    //   Get the token
    String token = json["token"];

    //  DEcode the token
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    int expInSeconds = decodedToken["exp"];

    DateTime expDate = DateTime.fromMillisecondsSinceEpoch(expInSeconds * 1000);

    User user = User.fromJson(decodedToken);
    
    AuthSession session = AuthSession(
      expiration: expDate,
      token: token,
      user: user,
    );


  } else {
    //   Get the error
    String error = json["error"];
    print("Error : \n $error");
  }
}
