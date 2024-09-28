class Todo {
  final int id;
  final String title;
  final String description;

  Todo({required this.id, required this.title, required this.description});

  //convert Todo to Json
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'description': description};
  }

  //Create a Todo from Json
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'], title: json['title'], description: json['description']);
  }
}
