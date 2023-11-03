import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortpoint/features/todo/presentation/domain/cubit/todo_cubit.dart';
import 'package:shortpoint/features/todo/presentation/widgets/app_bar.dart';
import 'package:shortpoint/features/todo/presentation/widgets/todo_form.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          title: "Edit Todo",
        ),
        body: BlocBuilder<TodosListCubit, TodosListState>(
          builder: (context, state) {
            return TodoForm(
                initialName: state.todos[index].name,
                onSave: (newName) {
                  context.read<TodosListCubit>().editTodoName(index, newName);
                  Navigator.pop(context);
                });
          },
        ));
  }
}
