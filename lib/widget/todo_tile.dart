import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("List 1"),
      trailing: Checkbox(
        value: false, onChanged: (bool? value) {  },
      ),
    );
  }
}