import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../dto/todo_dto.dart';
import '../repository/repository_exception.dart';
import 'dart:convert';
import '../../models/todo.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  // final List<Todo> fakeTodos = [
  //   Todo(id: '1', title: 'Buy groceries', completed: false),
  //   Todo(id: '2', title: 'Finish Flutter homework', completed: true),
  //   Todo(id: '3', title: 'Call the dentist', completed: false),
  //   Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
  //   Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  // ];

  Future<List<Todo>> getTodos() async {
    //  TODO
    //  Adapt the code to handle firebase data fetch

    String baseUrl = "https://todo-list-20e85-default-rtdb.firebaseio.com/";
    Uri url = Uri.parse('$baseUrl/todos.json');

    Response response = await http.get(url);

    //  TODO
    //  Ensure the message is displayed on the UI if error occured
    //  throw RepositoryException("No wifi !");

    if (response.statusCode != 200) {
      throw RepositoryException(
        "No wifi ! & Status code: ${response.statusCode}",
      );
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    List<Todo> toDoList = [];
    List<String> keys = json.keys.toList();

    for (int i = 0; i < keys.length; i++) {

      String jsonKey = keys[i];
      
      Todo todo = TodoDto.fromJson(jsonKey, json[jsonKey]);

      toDoList.add(todo);
    }

    return toDoList;
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    //  TODO
    //  Adapt the code to handle firebase data fetch

    Uri todoUrl = Uri.parse(
      "https://todo-list-20e85-default-rtdb.firebaseio.com/todos/$todoId.json",
    );

    Response response = await http.patch(
      todoUrl,
      body: jsonEncode({"completed": completed}),
    );

    if (response.statusCode != 200) {
      throw RepositoryException(
        "No wifi ! & Status code: ${response.statusCode}",
      );
    }
  }
}
