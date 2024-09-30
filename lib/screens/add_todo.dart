import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_with_bloc/colors/colors.dart';
import 'package:todo_list_with_bloc/fonts/fonts.dart';
import 'package:todo_list_with_bloc/todo_bloc/todo_bloc.dart';

class AddingTodo extends StatelessWidget {
  AddingTodo({super.key});
  
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Todo',
            style: headLine,
          ),
        ),
        body: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 8,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  
                  todoBloc.add(AddTodo(
                    title: titleController.text,
                    description: descriptionController.text,
                  ));
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(color: iconsColor),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
