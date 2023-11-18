import 'package:flutter/cupertino.dart';

import 'Todo.dart';

class TodoData extends ChangeNotifier {
  List<Todo> todos = [
    Todo(name: "Todo 1"),
    Todo(name: "Todo 2"),
    Todo(name: "Todo 3 qwe")
  ];

  int getCompletedTodosCount() {
    int completedTodo = todos.length;
    for (var element in todos) {
      if (element.isDone) {
        completedTodo--;
      }
    }

    return completedTodo;
  }

  int getLength() => todos.length;

  void addTodo(String name) {
    todos.add(Todo(name: name));
    notifyListeners();
  }

  void checkTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }
}
