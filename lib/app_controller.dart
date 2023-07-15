import 'package:flutter/material.dart';

class Todo {
  final String title;
  bool completed;

  Todo({
    required this.title,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'completed': completed,
      };
}

class AppController extends ChangeNotifier {
  List<Todo> todos = [];

  static AppController instance = AppController();

  setTodos(List<Todo> todos) {
    this.todos = todos;
    notifyListeners();
  }

  void add(Todo todo) async {
    todos.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  void toggle(Todo todo) {
    todo.completed = !todo.completed;

    todos.singleWhere((element) => element == todo).completed = todo.completed;

    notifyListeners();
  }
}
