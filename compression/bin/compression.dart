import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  String data = '';
  for(int i = 0; i<100; i++){
    data = data +'fala zeze\r\n';
  }
  //print(data);

  //convet to utf8
  List original = utf8.encode(data);
  //print(original);

  //compress datas
  List compressed = gzip.encode(original);
  //print(compressed);

  //Decompress
  List decompressed = gzip.decode(compressed);
  //print(decompressed);

  String decoded = utf8.decode(decompressed);
  assert(data == decoded);
  print(decoded);
}
