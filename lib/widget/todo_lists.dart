import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ease/model/TodoData.dart';
import 'package:todo_ease/widget/todo_tile.dart';

class TodoLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(
        builder: (BuildContext context, value, Widget? child) {
      return ListView.builder(
          itemCount: value.getLength(),
          itemBuilder: (context, index) {
            return TodoTile(
                isChecked: value.todos[index].isDone,
                todoTitle: value.todos[index].name,
                checkBoxCallback: (checkBoxState) {
                  // data(context).todos[index].toggleDone();
                  value.checkTodo(value.todos[index]);
                });
          });
    });
  }
}
