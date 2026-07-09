import 'dart:convert';
import 'package:flutter_project/W9/models/user.dart';
import 'package:flutter_project/W9/models/user.dart' as User;
import 'package:flutter_project/W9/ui/button_screen.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<ButtonScreen> getButtonStatus() async {
  final String firebaseUrl =
      'https://jeff-68fed-default-rtdb.asia-southeast1.firebasedatabase.app/';

  Uri url = Uri.parse(firebaseUrl);

  Response response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception(
      'Unable to fetch data from firebase ${response.statusCode}',
    );
  }

  Map<String, dynamic> jsonItem = jsonDecode(response.body);

  UserData user = User.fromJson(jsonItem);

  print(user);
}


