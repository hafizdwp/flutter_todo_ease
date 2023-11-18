import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ease/model/TodoPref.dart';
import 'package:todo_ease/widget/todo_tile.dart';

class TodoLists extends StatefulWidget {
  @override
  State<TodoLists> createState() => _TodoListsState();
}

class _TodoListsState extends State<TodoLists> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoPref>(context, listen: false).getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoPref>(
        builder: (BuildContext context, TodoPref data, Widget? child) {
      return ListView.builder(
          itemCount: data.todos.length,
          itemBuilder: (context, index) {
            return TodoTile(
                isChecked: data.todos[index].isDone,
                todoTitle: data.todos[index].name,
                checkBoxCallback: (checkBoxState) {
                  // data(context).todos[index].toggleDone();
                  // data.checkTodo(value.todos[index]);
                  data.toggleTodo(data.todos[index]);
                });
          });
    });
  }
}
