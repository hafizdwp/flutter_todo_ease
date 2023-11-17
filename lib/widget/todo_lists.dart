import 'package:flutter/material.dart';
import 'package:todo_ease/widget/todo_tile.dart';

import '../model/Todo.dart';

class TodoLists extends StatefulWidget {
  final List<String> savedTodos;

  const TodoLists({
    super.key,
    required this.savedTodos,
  });

  @override
  State<TodoLists> createState() => _TodoListsState();
}

class _TodoListsState extends State<TodoLists> {

  List<Todo> todos = [
    Todo(name: "List 1"),
    Todo(name: "List 2"),
    Todo(name: "List 3")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.savedTodos.length,
        itemBuilder: (context, index) {
          return TodoTile(
              isChecked: todos[index].isDone,
              todoTitle: todos[index].name,
              checkBoxCallback: (checkBoxState) {
                
              });
        });
  }
}
