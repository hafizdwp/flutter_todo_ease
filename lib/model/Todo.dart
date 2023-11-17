class Todo {
  final String name;
  bool isDone;

  Todo({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
