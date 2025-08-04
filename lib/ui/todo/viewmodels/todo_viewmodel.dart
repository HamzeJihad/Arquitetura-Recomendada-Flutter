import 'package:arquitetura_recomendada/config/dependencies.dart';
import 'package:arquitetura_recomendada/core/commands/commands.dart';
import 'package:arquitetura_recomendada/domain/models/todo.dart';
import 'package:flutter/widgets.dart';

class TodoViewmodel extends ChangeNotifier {
  late final Command0<List<Todo>> load;
  late final Command1<Todo, Todo> addTodo;
late final Command1<String, String> removeTodo;

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoViewmodel() {
    load = Command0<List<Todo>>(_load);
    addTodo = Command1<Todo, Todo>(_addTodo);
    removeTodo = Command1<String, String>(_removeTodo);
  }

  Future<Result<List<Todo>>> _load() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _todos = [
        Todo(id: '1', name: 'Todo 1', done: false, description: 'Description for Todo 1'),
        Todo(id: '2', name: 'Todo 2', done: true, description: 'Description for Todo 2'),
      ];
      notifyListeners(); 
      return Result.ok(_todos);
    } catch (e) {
      return Result.error(Exception('Failed to load todos'));
    }
  }

  Future<Result<Todo>> _addTodo(Todo todo) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _todos.add(todo);
      notifyListeners();
      return Result.ok(todo);
    } catch (e) {
      return Result.error(Exception('Failed to add todo'));
    }
  }

  Future<Result<String>> _removeTodo(String id) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final todo = _todos.firstWhere((todo) => todo.id == id);
      _todos.remove(todo);
      notifyListeners();
      return Result.ok('Todo removed successfully');
    } catch (e) {
      return Result.error(Exception('Failed to remove todo'));
    }
  }
}
