import 'package:arquitetura_recomendada/domain/models/todo.dart';
import 'package:arquitetura_recomendada/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';



void main(){
  group('Should test todoViewModel', (){

    test('Veryfing ViewModel initialState', (){
      final todoViewModel = TodoViewmodel();
      expect(todoViewModel.todos, isEmpty);
    });

    test('Should add Todo', ()async{
      final todoViewModel = TodoViewmodel();
      final todo = Todo(
        id: '1',
        name: 'Test Todo',
        description: 'This is a test todo',
        done: false,
      );

      await todoViewModel.addTodo.execute(todo);
      expect(todoViewModel.todos.length, 1);
      expect(todoViewModel.todos.first, todo);

    });

    test('Should remove todo', ()async{
      final todoViewModel = TodoViewmodel();
      final todo = Todo(
        id: '1',
        name: 'Test Todo',
        description: 'This is a test todo',
        done: false,
      );

      await todoViewModel.addTodo.execute(todo);
      expect(todoViewModel.todos.length, 1);

      await todoViewModel.removeTodo.execute(todo.id);
      expect(todoViewModel.todos.length, 0);
    });
  });
}