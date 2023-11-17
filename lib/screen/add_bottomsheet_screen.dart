import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBottomSheetScreen extends StatefulWidget {
  final VoidCallback onItemAdded;

  const AddBottomSheetScreen({super.key, required this.onItemAdded});

  @override
  State<AddBottomSheetScreen> createState() => _AddBottomSheetScreenState();
}

class _AddBottomSheetScreenState extends State<AddBottomSheetScreen> {
  final TextEditingController _textController = TextEditingController();

  void saveItemToSharedPref(String todo) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> savedTodos = prefs.getStringList('todos') ?? [];
    savedTodos.add(todo);

    prefs.setStringList('todos', savedTodos);

    // callback
    widget.onItemAdded();
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
                  controller: _textController,
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
                      onPressed: () {
                        setState(() {
                          saveItemToSharedPref(_textController.text);
                          Navigator.pop(context);
                        });
                      },
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
