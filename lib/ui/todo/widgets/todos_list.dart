import 'package:arquitetura_recomendada/domain/models/todo.dart';
import 'package:arquitetura_recomendada/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:arquitetura_recomendada/ui/todo/widgets/todo_tile.dart';
import 'package:arquitetura_recomendada/utils/typedefs/todos.dart';
import 'package:flutter/material.dart';


class TodosList extends StatelessWidget {
  final OnDeleteTodo onDeleteTodo;
  final TodoViewmodel todoViewmodel;
  final List<Todo> todos;
  const TodosList({
    super.key,
    required this.todos,
    required this.todoViewmodel,
    required this.onDeleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(
        child: Text("Nenhuma tarefa por enquanto..."),
      );
    }
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoTile(
          onDeleteTodo: onDeleteTodo,
          todo: todos[index],
          todoViewmodel: todoViewmodel,
        );
      },
    );
  }
}