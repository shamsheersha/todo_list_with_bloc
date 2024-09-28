part of 'todo_bloc.dart';


abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTodos extends TodoEvent{}

class AddTodo extends TodoEvent{
  final Todo todo;

  AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}


