import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool isChecked;
  final String todoTitle;
  final Function checkBoxCallback;

  TodoTile(
      {super.key,
      required this.isChecked,
      required this.todoTitle,
      required this.checkBoxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(todoTitle),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (newValue) {
            checkBoxCallback(newValue);
          },
        ));
  }
}
