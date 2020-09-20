//import 'package:testes/testes.dart';
import 'package:test/test.dart';

void main() {
  /*test('calculate', () {
    expect(calculate(), 42);
  });*/
  
  test('String.split, divider string.', (){
    String text = "test,test1,test2";
    expect(text.split(','), equals(['test', 'test1', 'test2']));
  });

  test('String.trim(), remove space on string', (){
    String text = ' house ';
    expect(text.trim(), equals('house'));
  });
}
