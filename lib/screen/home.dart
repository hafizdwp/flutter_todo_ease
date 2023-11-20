import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo_ease/controller/side_menu_controller.dart';
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
  SideMenuController controller = Get.put(SideMenuController());

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
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: const Text(
            "Todo Ease",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: SideMenu(controller: controller),
                  )),
              Expanded(
                  flex: 8,
                  child: Obx(() => controller.pages[controller.index.value]))
            ],
          ),
        ));
  }
}

class SideMenu extends StatelessWidget {
  SideMenu({super.key, required this.controller});

  final SideMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<SideMenuController>(
          init: controller,
          builder: (_) =>
              ListView(
                children: [

                  /// menu start
                  ListTile(
                      leading: Icon(Icons.today),
                      title: Text("Today"),
                      onTap: () {
                        controller.selectIndex(0);
                        print("tap today");
                      },
                      selected: controller.index.value == 0),
                  ListTile(
                      leading: Icon(Icons.home),
                      title: Text("All Todo"),
                      onTap: () {
                        controller.selectIndex(1);
                        print("tap all todo");
                      },
                      selected: controller.index.value == 1)
                ],
              )),
    );
  }
}

class OldHome extends StatelessWidget {
  const OldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          /// title
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(),
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
                        "You have ${Provider
                            .of<TodoPref>(context)
                            .todos
                            .length} tasks today!")
                  ],
                ),
              ),
            ),
          ),

          // margin
          const SizedBox(height: 16),

          /// content
          Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    color: Colors.white),
                child: TodoLists(),
              ))
        ],
      ),
    );
  }
}
