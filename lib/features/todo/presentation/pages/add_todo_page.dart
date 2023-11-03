import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortpoint/features/todo/presentation/domain/cubit/todo_cubit.dart';
import 'package:shortpoint/features/todo/presentation/widgets/app_bar.dart';
import 'package:shortpoint/features/todo/presentation/widgets/todo_form.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Add Todo",
        ),
        backgroundColor: Color(0xffF3F3F3),
        body: BlocBuilder<TodosListCubit, TodosListState>(
          builder: (context, state) {
            return TodoForm(onSave: (newName) {
              context.read<TodosListCubit>().add(newName);
              Navigator.pop(context);
            });
          },
        ));
  }
}
