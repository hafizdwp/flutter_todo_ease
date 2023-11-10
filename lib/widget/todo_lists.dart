import 'package:flutter/material.dart';

class TodoLists extends StatefulWidget {
  const TodoLists({
    super.key,
  });

  @override
  State<TodoLists> createState() => _TodoListsState();
}

class _TodoListsState extends State<TodoLists> {
  List<String> itemList = List.generate(5, (index) => "List Todo ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              itemList[index],
              style: TextStyle(
                  decoration: itemList[index].isEmpty
                      ? TextDecoration.lineThrough
                      : null),
            ),
            trailing: Checkbox(
              value: false,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    setState(() {
                      itemList.removeAt(index);
                    });
                  }
                });
              },
            ),
            onTap: () {
              setState(() {
                itemList.removeAt(index);
              });
            },
          );
        });
  }
}
