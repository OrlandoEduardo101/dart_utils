import 'dart:io';
import 'package:binary_search/binary_search.dart' as calc;

void main(List<String> arguments) {
  Stopwatch timer = Stopwatch();
  
  var list = calc.getList();
  list.sort(); //ordenando a lista
  print('Lista ordenada: $list');
  print('insira o elemento a ser buscado:\r');
  dynamic item = stdin.readLineSync();
  timer.start();
  var result = calc.binarySearch(list, int.parse(item), list.length);
  if (result < 0) {
    print('Elemento não encontrado \n');
  } else {
    print('O elemento está na posição ${result} \n');
  }
  timer.stop();
  print('Tempo de busca: ${timer.elapsedMilliseconds} ms');
  
}
