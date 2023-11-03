class Todo {
  String name;
  bool isChecked;
  Todo({
    required this.name,
    required this.isChecked,
  });

  Todo copyWith({
    String? name,
    bool? isChecked,
  }) {
    return Todo(
      name: name ?? this.name,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
