import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final int number;

  TodoTile({super.key, required this.number});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("List Todo ${widget.number}"),
      trailing: Checkbox(
        value: false,
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {

            }
          });
        },
      ),
    );
  }
}
