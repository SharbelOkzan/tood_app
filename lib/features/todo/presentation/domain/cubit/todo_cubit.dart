import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shortpoint/features/todo/presentation/domain/entities/todo.dart';

class TodosListCubit extends Cubit<TodosListState> {
  TodosListCubit() : super(TodosListState.initial());

  void add(String todoName) {
    final Todo todo = Todo(
      name: todoName,
      isChecked: false,
    );
    emit(state.copyWith(todos: [...state.todos, todo]));
  }

  void check(int index) {
    final Todo todo =
        state.todos[index].copyWith(isChecked: !state.todos[index].isChecked);
    final List<Todo> todos =
        List.from(state.todos..replaceRange(index, index + 1, [todo]));
    emit(state.copyWith(todos: todos));
  }

  void editTodoName(int index, String newName) {
    final Todo todo = state.todos[index].copyWith(name: newName);
    final List<Todo> todos =
        List.from(state.todos..replaceRange(index, index + 1, [todo]));
    emit(state.copyWith(todos: todos));
  }
}

class TodosListState {
  List<Todo> todos;

  TodosListState({
    required this.todos,
  });

  TodosListState.initial() : todos = [];

  TodosListState copyWith({
    List<Todo>? todos,
  }) {
    return TodosListState(
      todos: todos ?? this.todos,
    );
  }
}
