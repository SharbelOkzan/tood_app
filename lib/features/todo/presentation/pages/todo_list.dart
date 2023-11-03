import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortpoint/features/todo/presentation/domain/cubit/todo_cubit.dart';
import 'package:shortpoint/features/todo/presentation/pages/add_todo_page.dart';
import 'package:shortpoint/features/todo/presentation/widgets/premium_banner_widget.dart';
import 'package:shortpoint/features/todo/presentation/widgets/todo_list_header.dart';

import '../widgets/todo_widget.dart';
import 'edit_todo_page.dart';

class TodosListPage extends StatelessWidget {
  const TodosListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TodosListCubit(),
      child: Builder(builder: (builderContext) {
        return BlocBuilder<TodosListCubit, TodosListState>(
            builder: (context, state) {
          return Scaffold(
            floatingActionButton: const _AddTodoFAB(),
            body: Column(
              children: [
                const TodosListHeader(),
                const PremiumBannerWidget(),
                Expanded(
                  child: ListView(children: [
                    for (int i = 0; i < state.todos.length; i++)
                      TodoWidget(
                        name: state.todos[i].name,
                        isChecked: state.todos[i].isChecked,
                        onEditPressed: () => _onEditPressed(builderContext, i),
                        onCheckboxChanged: () =>
                            context.read<TodosListCubit>().check(i),
                      )
                  ]),
                ),
              ],
            ),
          );
        });
      }),
    );
  }

  _onEditPressed(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => BlocProvider<TodosListCubit>.value(
                  value: context.read<TodosListCubit>(),
                  child: EditTodoPage(index: index),
                )));
  }
}

class _AddTodoFAB extends StatelessWidget {
  const _AddTodoFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff071D55),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => BlocProvider<TodosListCubit>.value(
                      value: context.read<TodosListCubit>(),
                      child: const AddTodoPage(),
                    )));
      },
      child: const Icon(Icons.add),
    );
  }
}
