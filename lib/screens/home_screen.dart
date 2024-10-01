import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_with_bloc/colors/colors.dart';
import 'package:todo_list_with_bloc/fonts/fonts.dart';
import 'package:todo_list_with_bloc/screens/add_todo.dart';
import 'package:todo_list_with_bloc/todo_bloc/todo_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo List', style: headLine),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: iconsColor,
                )),
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.pink,
                ),
              );
            } else if (state is TodoLoaded) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.pink[500],
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: ListTile(
                      title: Text(state.todos[index]['title'],style:const TextStyle(color: Colors.black),),
                      subtitle: Text(state.todos[index]['description'],style:const TextStyle(color: Colors.black),),
                      trailing: IconButton(
                          onPressed: () {
                            context
                                .read<TodoBloc>()
                                .add(DeleteTodo(state.todos[index]['_id']));
                          },
                          icon: const Icon(Icons.delete,color: Colors.black,)),
                          
                    ),
                  );
                },
              );
            } else if (state is TodoError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('No Todos'),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddingTodo()));
          },
          label: const Text(
            'Add',
            style: TextStyle(color: iconsColor),
          ),
          backgroundColor: Colors.black26,
        ),
      ),
    );
  }
}
