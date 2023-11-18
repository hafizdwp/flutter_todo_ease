class Todo {
  final String name;
  bool isDone;

  Todo({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  // Convert Task to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  // Create Task from Map
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      name: map['name'],
      isDone: map['isDone'] ?? false,
    );
  }
}
