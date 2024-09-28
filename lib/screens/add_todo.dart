import 'package:flutter/material.dart';
import 'package:todo_list_with_bloc/colors/colors.dart';
import 'package:todo_list_with_bloc/fonts/fonts.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo',
          style: headLine,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    
                    decoration:const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),

                const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:const InputDecoration(
              
                      hintText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: 8,
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){}, child:const Text('Save',style: TextStyle(color: iconsColor),))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
