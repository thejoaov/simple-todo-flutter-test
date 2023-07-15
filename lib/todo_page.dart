import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  late List<String> todos = [];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      setState(() {
        todos =
            List<String>.from(json.decode(prefs.getString("todos") ?? "[]"));
      });
    });
  }

  final todoField = TextEditingController();
  String todo = '';

  void addTodo(String todo) {
    setState(() {
      todos.add(todo);
      todo = '';
    });
    prefs.setString(
      'todos',
      jsonEncode(todos),
    );
    todoField.clear();
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
      prefs.setString(
        'todos',
        todos.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    key: const Key('add_todo'),
                    controller: todoField,
                    onChanged: (value) {
                      setState(() {
                        todo = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Add Todo',
                    ),
                    onSubmitted: (value) {
                      if (todo.isEmpty) return;
                      addTodo(todo);
                    },
                  ),
                ),
                IconButton.filled(
                  key: const Key('add_todo_button'),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (todo.isEmpty) return;
                    addTodo(todo);
                  },
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      removeTodo(
                        index,
                      );
                    },
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
