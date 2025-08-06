import 'package:arquitetura_recomendada/domain/models/todo.dart';
import 'package:arquitetura_recomendada/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:arquitetura_recomendada/utils/typedefs/todos.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final OnDeleteTodo onDeleteTodo;
  final TodoViewmodel todoViewmodel;
  final Todo todo;
  const TodoTile({
    super.key,
    required this.todo,
    required this.todoViewmodel,
    required this.onDeleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (value) {
            },
          ),
          title: Text(todo.name),
          trailing: IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}