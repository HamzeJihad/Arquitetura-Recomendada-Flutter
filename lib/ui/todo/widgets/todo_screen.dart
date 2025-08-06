import 'package:arquitetura_recomendada/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:arquitetura_recomendada/ui/todo/widgets/add_todo_widget.dart';
import 'package:arquitetura_recomendada/ui/todo/widgets/todos_list.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  final TodoViewmodel todoViewmodel;
  const TodoScreen({super.key, required this.todoViewmodel});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todos screen")),
      body: ListenableBuilder(
        listenable: widget.todoViewmodel.load,
        builder: (context, child) {
          if (widget.todoViewmodel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (widget.todoViewmodel.load.error) {
            return const Center(child: Text("Ocorreu um erro ao carregar todos..."));
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: widget.todoViewmodel,
          builder: (context, child) {
            return TodosList(
              onDeleteTodo: (todo) {},
              todos: widget.todoViewmodel.todos,
              todoViewmodel: widget.todoViewmodel,
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTodoWidget(todoViewmodel: widget.todoViewmodel);
            },
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
