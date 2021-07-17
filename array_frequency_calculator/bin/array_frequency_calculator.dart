import 'dart:io';

import 'package:array_frequency_calculator/array_frequency_calculator.dart' as array_frequency_calculator;

void main(List<String> arguments) {
  print("Insira um texto");
  String text = stdin.readLineSync();
  Map map = WordsCalculator(text);
  print('PALAVRA -------------- FREQUENCIA');
  map.forEach((key, value) {
    print('$key -------------- $value');
  });
}

Map<String, int> WordsCalculator(String text){
  List<String> array = (text.split(' '));
  List<String> array2 = (text.split(' '));

  Map<String, int> frequencyWords = {};
  //int countWord = 0;
  for(int i = 0; i < array.length; i++){
    var countWord=0;
    //print(array);
    for(int j = 0; j < array2.length; j++){

      if(array[i].toUpperCase().trim() == array2[j].toUpperCase().trim()){
          ++countWord;
          array2[j] = '#';
          //print(array2);
          //print(countWord);

          frequencyWords.addAll(
              {
                array[i].trim() : countWord
              }
          );

      }

      //print(countWord);



    }
  }
  return frequencyWords;
}