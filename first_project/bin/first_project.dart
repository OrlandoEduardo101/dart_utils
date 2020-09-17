import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';

void main(List<String> arguments) {

  menu();

}

void menu(){
  print('################## Home #################');
  print('\nSelect a option:');
  print('\n1 - Show today cotation');
  print('\n2 - Register today cotation');
  print('\n3 - show registers  cotation');

  String option = stdin.readLineSync();
  switch(int.parse(option)){
    case 1: today(); break;
    case 2: registerData(); break;
    case 3: listData(); break;
    default: print('invalid option, try again.'); menu(); break;
  }
}

void registerData() async {
  var hgData = await getData();
  dynamic fileData = readFile();

  fileData = (fileData != null && fileData != '' ? json.decode(fileData) : List());

  bool exists = false;
  fileData.forEach((data){
    if(data['date'] == now())
      exists = true;
  });

  if(!exists) {
    fileData.add({'date': now(), 'data': '${hgData['data']}'});

    Directory dir = Directory.current;
    File file = new File(dir.path + '/my_file.txt');
    RandomAccessFile raf = file.openSync(mode: FileMode.write);

    raf.writeStringSync(json.encode(fileData).toString());
    raf.flushSync();
    raf.close();
    print(
        '\n\n################### Sucess saved data ###############################');
  }
  else
    print('\n\n################### Register alredy exists ###############################');
}

void listData(){
  dynamic fileData = readFile();
  fileData = (fileData != null && fileData != '' ? json.decode(fileData) : List());

  print('\n\n##################### List datas ########################');
  fileData.forEach((data){
    print('${data['date']} ---> ${data['data']}');
  });
}

String readFile(){
  Directory dir = Directory.current;
  File file = new File(dir.path + '/my_file.txt');
  if(!file.existsSync()){
    print('Arquivo não encontrado!');
    return null;
  }
  return file.readAsStringSync();
}

void today() async {
  var data = await getData();
  print('\n\n########### HG Brasil - Cotation ###########');
  print('${data['date']} ---> ${data['data']}');
}

Future getData() async {

  String url = 'https://api.hgbrasil.com/finance?key=c33592bb';
  var response = await Dio().get(url);

  if(response.statusCode == 200){
    var data = response.data['results']['currencies'];
    //print(data);
    var usd = data['USD'];
    var eur = data['EUR'];
    var gbp = data['GBP'];
    var ars = data['ARS'];
    var btc = data['BTC'];

    Map formatedMap = Map();
    formatedMap['date'] = now();
    formatedMap['data'] = '${usd['name']}: ${usd['buy']} | ${eur['name']}: ${eur['buy']} | ${gbp['name']}: ${gbp['buy']} | ${ars['name']}: ${ars['buy']} | ${btc['name']}: ${btc['buy']}';
    return formatedMap;
  }
  else
    throw('Failed');
}

String now(){
  var now = DateTime.now();
  return '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString().padLeft(2, '0')}';
}

