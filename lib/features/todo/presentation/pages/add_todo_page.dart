import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortpoint/features/todo/presentation/domain/providers/todos_provider.dart';
import 'package:shortpoint/features/todo/presentation/widgets/app_bar.dart';
import 'package:shortpoint/features/todo/presentation/widgets/todo_form.dart';

class AddTodoPage extends ConsumerWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Add Todo",
        ),
        backgroundColor: Color(0xffF3F3F3),
        body: TodoForm(onSave: (newName) {
          ref.read(todosProvider.notifier).add(newName);
          Navigator.pop(context);
        }));
  }
}
