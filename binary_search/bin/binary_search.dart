import 'dart:io';
import 'package:binary_search/binary_search.dart' as calc; //import dos metodos de preencher e buscar

void main(List<String> arguments) {
  Stopwatch timer = Stopwatch(); //instanciando o timer
  
  var list = calc.getList(); //método de preencher a lista com entradas do teclado
  list.sort(); //ordenando a lista

  print('Lista ordenada: $list');
  print('insira o elemento a ser buscado:\r');
  dynamic item = stdin.readLineSync(); //pegando elemento a ser buscado do teclado
  timer.start(); //iniciando o timer para calcular o tempo de busca
  var result = calc.binarySearch(list, int.parse(item), list.length); //chamando o metodo de busca e atribuindo a variavel result
  
  //testando se o elemento foi encontrado e exibindo
  if (result < 0) {
    print('Elemento não encontrado \n');
  } else {
    print('O elemento está na posição ${result} \n');
  }

  //parando e imprimindo o timer
  timer.stop();
  print('Tempo de busca: ${timer.elapsedMilliseconds} ms');
  
}
