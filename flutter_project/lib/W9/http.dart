import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Todo {
  // YOUR CODE
}

Future<Todo> fetchTodo() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/3");

  Response response = await http.get(url);

  Map<String, dynamic> json =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
 

  Todo result = Todo();
  // YOUR CODE
  return result;
}

void main() async {

  // Call the fetch and dispaly the TODOx
 
}
