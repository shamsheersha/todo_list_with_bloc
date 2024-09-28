import 'package:flutter/material.dart';
import 'package:todo_list_with_bloc/colors/colors.dart';
import 'package:todo_list_with_bloc/fonts/fonts.dart';
import 'package:todo_list_with_bloc/screens/add_todo.dart';

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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddTodo()));
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
