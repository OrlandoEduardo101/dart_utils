import 'dart:io';
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) {

  List<String> files = List<String>();

  Directory.current.listSync().forEach((element) {
    if(element.statSync().type == FileSystemEntityType.file)
      files.add(element.path);
  });

  String zipfile = '${Directory.current.path}/comprimido.zip';
  zip(files, zipfile);

  unzip(zipfile, '${Directory.current.path}/descomprimido');

  /*int zlib_comp = testCompress(zlib);
  int gzip_comp = testCompress(gzip);

  print('zlib = ${zlib_comp}');
  print('glib = ${gzip_comp}');*/

  /*
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
  print(decoded);*/


}

void zip(List<String> files, String zipfile) {
  Archive archive = Archive();
  files.forEach((element) {
    File file = File(element);

    ArchiveFile archiveFile = ArchiveFile(path.basename(element), file.lengthSync(), file.readAsBytesSync());
    archive.addFile(archiveFile);
  });

  ZipEncoder encoder = ZipEncoder();
  File f = File(zipfile);
  f.writeAsBytesSync(encoder.encode(archive));
  print('Comprimido com sucesso!');
}

void unzip(String zip, String path){
  File file = File(zip);
  Archive archive = ZipDecoder().decodeBytes(file.readAsBytesSync());
  archive.forEach((element) {
    File file = File(path+'/'+element.name);
    file.createSync(recursive: true);
    file.writeAsBytesSync(element.content);
  });
  print('Descomprimido com sucesso');
}



/*
String generateData(){
  String data = '';
  for(int i = 0; i<10000000; i++){
    data = data +'fala zeze\r\n';
  }
  //print(data);
  return data;
}

int testCompress(var codec){
  String data = generateData();

  List original = utf8.encode(data);
  List compressed = codec.encode(original);
  List decompressed = codec.decode(compressed);

  print('Testing ${codec.toString()} bytes');
  print('Original ${original.length} bytes');
  print('Comprimido ${compressed.length} bytes');
  print('Descomprimido ${decompressed.length} bytes');

  print('');

  String decoded = utf8.decode(decompressed);
  assert(data == decoded);

  return compressed.length;

}*/