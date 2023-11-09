import 'package:flutter/material.dart';
import 'package:todo_ease/widget/todo_tile.dart';

class TodoLists extends StatelessWidget {
  const TodoLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 8,),
        TodoTile(),
        TodoTile()
      ],
    );
  }
}