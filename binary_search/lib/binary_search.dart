import 'dart:io';

List<int> getList() {
  var controller = true; //flag para parar o loop
  var list = <int>[];
  print(' ########### insira um valor ###########');

  while (controller) {
    print('digite um valor:\r');
    final value = stdin.readLineSync();
    list.add(int.parse(value));

    print('Deseja adicionar mais um valor? (responda S ou N)\r');
    final flag = stdin.readLineSync().toUpperCase();
    if (flag.contains('N')) {
      controller = false;
    }
  }
  print('Lista inserida: $list');
  return list;
}


//metodo de busca binária
int binarySearch(List<int> list, dynamic item, int length) {
  
  int bottom_list = 0;
  int higher_list = (length - 1);
  int half_list;

  //loop para ir dividindo a lista até encontrar o valor
  while (bottom_list <= higher_list) {
    half_list = (bottom_list + higher_list) ~/ 2;
    if (item == list[half_list]) 
      return half_list; //retorna o indice do valor encontrado
    
    if (item < list[half_list]) 
      higher_list = half_list - 1;

    else 
      bottom_list = half_list + 1;
    
  }
  //retorna -1 se não encontrou o valor
  return -1;
}
