import 'package:riverpod/riverpod.dart';

import '../entities/todo.dart';

NotifierProvider<TodosListState, List<Todo>> todosProvider =
    NotifierProvider<TodosListState, List<Todo>>(() => TodosListState());

class TodosListState extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [];
  }

  void add(String todoName) {
    _add(Todo(
      name: todoName,
      isChecked: false,
    ));
  }

  void _add(Todo todo) {
    state = [...state, todo];
  }

  void check(int index) {
    state = [...state]..replaceRange(
        index,
        index + 1,
        [
          state[index].copyWith(isChecked: !state[index].isChecked),
        ],
      );
  }

// only for simplicity
  void editName(int index, String name) {
    _edit(index, state[index].copyWith(name: name));
  }

  void _edit(int index, Todo todo) {
    state = [...state]..replaceRange(
        index,
        index + 1,
        [
          todo,
        ],
      );
  }
}
