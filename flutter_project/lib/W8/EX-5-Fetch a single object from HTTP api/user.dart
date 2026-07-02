import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

  Response response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch user 1 ${response.statusCode}');
  }

  Map<String, dynamic> jsonItem = jsonDecode(response.body);

  User user = User.fromJson(jsonItem);

  print(user);
}

class User {
  final int id;
  final String name;
  final String username;    
  final String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });


  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }

  @override
  String toString() {
    return "User $id: $name, $username - Email: $email";
  }
}
