import 'package:arquitetura_recomendada/config/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
 group('Should test Ok Result', (){

    test('Should create a Ok Result', (){
      final result = Result.ok('Ok');
      expect(result.asOk.value, 'Ok');

    });

    test('Should create a Error Result', (){
      final result = Result.error(Exception('Error'));
      expect(result.asError.error, isA<Exception>());
    });

    test('Should return Ok Result when calling ok extension', (){
      final result = 'Ok'.ok();
      expect(result.asOk.value, 'Ok');
    });

    test('Should return Error Result when calling error extension', (){
      final result = Exception('Error').error();
      expect(result.asError.error, isA<Exception>());
    });
 });
}