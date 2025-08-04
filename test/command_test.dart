
import 'package:arquitetura_recomendada/config/dependencies.dart';
import 'package:arquitetura_recomendada/core/commands/commands.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('Shold test Commands', (){
    test('Should create a Command0', () {
      final command = Command0<String>(() async => Result.ok('Command0 executed'));
      expect(command, isA<Command0<String>>());
    });

    test('Should create a Command1', () {
      final command = Command1<String, int>((arg) async => Result.ok('Command1 executed with arg: $arg'));
      expect(command, isA<Command1<String, int>>());
    });

    test('Should create a Command2', () {
      final command = Command2<String, int, String>((arg1, arg2) async => Result.ok('Command2 executed with args: $arg1, $arg2'));
      expect(command, isA<Command2<String, int, String>>());
    });
  });
}