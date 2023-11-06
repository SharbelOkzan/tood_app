import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortpoint/features/todo/presentation/domain/providers/todos_provider.dart';
import 'package:shortpoint/features/todo/presentation/pages/add_todo_page.dart';
import 'package:shortpoint/features/todo/presentation/widgets/premium_banner_widget.dart';
import 'package:shortpoint/features/todo/presentation/widgets/todo_list_header.dart';

import '../widgets/todo_widget.dart';
import 'edit_todo_page.dart';

class TodosListPage extends ConsumerWidget {
  const TodosListPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      floatingActionButton: const _AddTodoFAB(),
      body: Column(
        children: [
          const TodosListHeader(),
          const PremiumBannerWidget(),
          Expanded(
            child: ListView(children: [
              for (int i = 0; i < ref.watch(todosProvider).length; i++)
                TodoWidget(
                  name: ref.watch(todosProvider)[i].name,
                  isChecked: ref.watch(todosProvider)[i].isChecked,
                  onEditPressed: () => _onEditPressed(context, i),
                  onCheckboxChanged: () =>
                      ref.read(todosProvider.notifier).check(i),
                )
            ]),
          ),
        ],
      ),
    );
  }

  _onEditPressed(BuildContext context, int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => EditTodoPage(index: index)));
  }
}

class _AddTodoFAB extends StatelessWidget {
  const _AddTodoFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff071D55),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const AddTodoPage())),
      child: const Icon(Icons.add),
    );
  }
}
