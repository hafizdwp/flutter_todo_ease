import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ease/model/TodoPref.dart';

import '../widget/todo_lists.dart';
import 'add_bottomsheet_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoPref(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
            fontFamily: 'poppins'),
        home: const HomeScreen(title: 'Todo Ease'),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget addTodoBottomSheet(BuildContext context) {
    return AddBottomSheetScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: addTodoBottomSheet,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.0))));
        },
        backgroundColor: Colors.blueAccent,
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// title
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text("Todo Ease",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white)),
                      Text(
                          // "You have ${Provider.of<TodoData>(context).getCompletedTodosCount()} Tasks today!")
                          "You have ${Provider.of<TodoPref>(context).todos.length} tasks today!")
                    ],
                  ),
                ),
              ),
            ),

            // margin
            SizedBox(height: 16),

            /// content
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      color: Colors.white),
                  child: TodoLists(),
                ))
          ],
        ),
      ),
    );
  }
}
