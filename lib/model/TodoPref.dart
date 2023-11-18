import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Todo.dart';

class TodoPref extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void getTodos() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    List<String> strings = preferences.getStringList('todos') ?? [];
    _todos = strings.map((e) {
      final todoMap = json.decode(e);
      return Todo.fromMap(todoMap);
    }).toList();

    notifyListeners();
  }

  void addTodo(String todo) async {
    _todos.add(Todo(name: todo));

    await saveTodos();

    notifyListeners();
  }

  void toggleTodo(Todo todo) async {
    for (Todo t in _todos) {
      if (t == todo) {
        t.toggleDone();
      }
    }

    await saveTodos();

    notifyListeners();
  }

  Future<void> saveTodos() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> todoStrings =
        _todos.map((todo) => json.encode(todo.toMap())).toList();

    preferences.setStringList('todos', todoStrings);
  }
}
