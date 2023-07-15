import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  final List<String> todos = [];
  final todoField = TextEditingController();
  String todo = '';

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
                      setState(() {
                        todos.add(value);
                        todoField.clear();
                        todo = '';
                      });
                    },
                  ),
                ),
                IconButton.filled(
                  key: const Key('add_todo_button'),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (todo.isEmpty) return;
                    setState(() {
                      todos.add(todo);
                      todoField.clear();
                      todo = '';
                    });
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
                      setState(() {
                        todos.removeAt(index);
                      });
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
