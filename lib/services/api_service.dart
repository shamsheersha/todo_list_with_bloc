import 'dart:convert';

import 'package:todo_list_with_bloc/model/todo_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final url = 'https://api.nstack.in/v1/todos';

  Future addTodo(Todo todo) async {
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todo.toJson()));

        if(response.statusCode != 201 && response.statusCode != 200){
          throw Exception('Failed to add todo');
        }
  }

  Future<List<Todo>> fetchTodos()async{

  }
}
