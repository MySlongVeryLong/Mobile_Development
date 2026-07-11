import '../../models/todo.dart';

class TodoDto {
  static const id = "id";
  static const title = "title";
  static const completed = "completed";

  static Todo fromJson(String id, Map<String, dynamic> json) {
    // Assert the map contains the keys  title and completed with the right data types

    assert(json["title"] is String);
    assert(json["completed"] is bool);

    final String title = json["title"];
    final bool completed = json["completed"];

    // Return the right todo object by reading the json map
    return Todo(id: id, title: title, completed: completed);
  }

  static Map<String, dynamic> toJson(Todo todo) {
    return {title: todo.title, completed: todo.completed};
  }
}
