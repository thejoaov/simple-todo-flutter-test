import 'package:flutter/material.dart';
import 'package:simple_todo_flutter/app_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
  }

  List todos = AppController.instance.todos;
  final todoField = TextEditingController();
  String todo = '';

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
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
                          },
                        ),
                      ),
                      IconButton.filled(
                        key: const Key('add_todo_button'),
                        icon: const Icon(Icons.add),
                        onPressed: () async {
                          if (todo.isEmpty) return;
                          AppController.instance
                              .add(Todo(title: todo, completed: false));
                          todoField.clear();
                          todo = '';
                        },
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        key: Key('todo_item_$index'),
                        title: Text(todos[index].title),
                        leading: Checkbox(
                          key: Key('todo_item_$index'),
                          value: todos[index].completed,
                          onChanged: (value) {
                            AppController.instance.toggle(todos[index]);
                          },
                        ),
                        trailing: IconButton(
                          key: Key('remove_todo_item_$index'),
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            AppController.instance.remove(todos[index]);
                          },
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
          );
        });
  }
}
