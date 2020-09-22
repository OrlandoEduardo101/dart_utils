import 'dart:io';

List<int> getList() {
  var controller = true;
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

int binarySearch(List<int> list, dynamic item, int length) {
  
  int inf = 0;
  int sup = (length - 1);
  int half;
  while (inf <= sup) {
    half = (inf + sup) ~/ 2;
    if (item == list[half]) {
      return half;
    }
    if (item < list[half]) {
      sup = half - 1;
    } else {
      inf = half + 1;
    }
  }
  
  return -1;
}
