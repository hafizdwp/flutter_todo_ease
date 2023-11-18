import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ease/model/TodoPref.dart';

class AddBottomSheetScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  void onAddTodoButton(BuildContext context) {
    Provider.of<TodoPref>(context, listen: false)
        .addTodo(_textEditingController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: _textEditingController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(hintText: "Add Todo Here"),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => onAddTodoButton(context),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.green,
                          backgroundColor: Colors.blueAccent,
                          shape: StadiumBorder()),
                      child: Text(
                        'Add Todo',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
