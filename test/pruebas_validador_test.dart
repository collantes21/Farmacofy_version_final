import 'package:farmacofy/utils/validar_pruebas.dart';
import 'package:flutter_test/flutter_test.dart';
 
 
void main() {//tenemos 4 testes que estan comentados, descomente uno e pulse RUN
 
  // Expected: <true>
  // Actual: <false> porque o ano nao esta entre 1900 e 2100
test('isDateValid should return true for a valid date', () {
      final validations = Validations();
      expect(validations.isDateValid('7777/02/15'), false);
    });
 
 

}