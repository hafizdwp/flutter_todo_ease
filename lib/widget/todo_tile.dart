import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final bool isChecked;
  final String todoTitle;
  final Function checkBoxCallback;

  const TodoTile(
      {super.key,
      required this.isChecked,
      required this.todoTitle,
      required this.checkBoxCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("tapped"),
      child: ListTile(
          title: Text(todoTitle,
              style: isChecked
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null),
          trailing: Checkbox(
            value: isChecked,
            onChanged: (newValue) {
              checkBoxCallback(newValue);
            },
          )),
    );
  }
}
