import 'package:arquitetura_recomendada/config/dependencies.dart';
import 'package:flutter/widgets.dart';

typedef CommandAction0<T extends Object> = Future<Result<T>> Function();

typedef CommandAction1<T extends Object, A> = Future<Result<T>> Function(A arg);

typedef CommandAction2<T extends Object, A, B> = Future<Result<T>> Function(A arg1, B arg2);

abstract class Command<T extends Object> extends ChangeNotifier {
  bool _running = false;

  Result<T>? _result;

  bool get completed => _result is Ok;
  bool get running => _running;
  bool get error => _result is Error;

  Result<T>? get result => _result;

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) {
      return;
    }
    _running = true;
    _result = null;
    notifyListeners();
    try {
      _result = await action();
    } catch (e) {
      _result = Error(e as Exception);
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}


class Command0<T extends Object> extends Command<T> {
  final CommandAction0<T> action;

  Command0(this.action);

  Future<void> execute() async {
    await _execute(action);
  }
}

class Command1<T extends Object, A> extends Command<T> {
  final CommandAction1<T, A> action;

  Command1(this.action);

  Future<void> execute(A arg) async {
    await _execute(() => action(arg));
  }
}

class Command2<T extends Object, A, B> extends Command<T> {
  final CommandAction2<T, A, B> action;

  Command2(this.action);

  Future<void> execute(A arg1, B arg2) async {
    await _execute(() => action(arg1, arg2));
  }
}