import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortpoint/features/todo/presentation/domain/providers/todos_provider.dart';
import 'package:shortpoint/features/todo/presentation/widgets/app_bar.dart';
import 'package:shortpoint/features/todo/presentation/widgets/todo_form.dart';

class EditTodoPage extends ConsumerWidget {
  const EditTodoPage({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: const MyAppBar(
          title: "Edit Todo",
        ),
        body: TodoForm(
            initialName: ref.watch(todosProvider)[index].name,
            onSave: (newName) {
              ref.read(todosProvider.notifier).editName(index, newName);
              Navigator.pop(context);
            }));
  }
}
