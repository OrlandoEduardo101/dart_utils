import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

void main(List<String> arguments) {

  menu();

 /* Directory dir = Directory.current;
  print(dir.path);
  
  File file = File(dir.path +'/my_file.txt');

  readFile(file);*/
}

void menu(){
  print('################## Home #################');
  print('\nSelect a option');
  print('\n1 - Show today cotation');

  String option = stdin.readLineSync();
  switch(int.parse(option)){
    case 1: today(); break;
    default: print('invalid option, try again.'); menu(); break;
  }
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


/*
void readFile(File file){
  if(!file.existsSync()){
    print('not founded');
    return;
  }
  print("Initing read...");
  print(file.readAsStringSync());

  print("Reading bytes...");
  List values = file.readAsBytesSync();
  values.forEach((element) => print(element));
}*/