//import 'package:testes/testes.dart';
import 'package:test/test.dart';

void main() {
  /*test('calculate', () {
    expect(calculate(), 42);
  });*/
  
  group('String',(){
    test('String.split, divider string.', (){
      String text = "test,test1,test2";
      expect(text.split(','), equals(['test', 'test1', 'test2']));
    });

    test('String.trim(), remove space on string', (){
      String text = ' house ';
      expect(text.trim(), equals('house'));
    });
  });

  group('Int', (){
    test('.reminder, return rest of Division', (){
      expect(17.remainder(3), equals(2));
    });
    
    test('.toRadixString() return hex string', (){
      expect(11.toRadixString(16), equals('b'));
    });
  });
}
