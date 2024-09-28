import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list_with_bloc/model/todo_model.dart';
import 'package:http/http.dart' as http;

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {


  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>(
      (event, emit) async {
        emit(TodoLoading());

        try {
          final response = await http.post(Uri.parse(url),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(event.todo.toJson()));
          print(response);
          if (response.statusCode == 201 || response.statusCode == 200) {
            //Assuming the API returns all todos after creation
            add(FetchTodos());
          } else {
            emit(TodoError(message: 'Failed to add todooooooo'));
          }
        } catch (e) {
          emit(TodoError(message: e.toString()));
        }
      },
    );

    on<FetchTodos>(
      (event, emit) async {
        emit(TodoLoading());

        try {
          final response = await http.get(Uri.parse(url));

          if (response.statusCode == 200) {
            List todosJson = jsonDecode(response.body);
            List<Todo> todos = todosJson.map((e) => Todo.fromJson(e)).toList();
            emit(TodoLoaded(todos: todos));
          } else {
            emit(TodoError(message: 'Failed to fetch todos'));
          }
        } catch (e) {
          emit(TodoError(message: e.toString()));
        }
      },
    );
  }
}
