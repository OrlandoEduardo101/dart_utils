import 'dart:html';

import 'package:dio/dio.dart';

void main() {
  /* querySelector('#output').text = 'Your Dart app is running.';
  querySelector('#output').onClick.listen((event) {
    querySelector('#output').text = 'fala zeze.';
    print('click');
  });*/

  querySelector('#search').onClick.listen((event) async {
    var cep = (querySelector('#cep') as InputElement).value;
    var url = 'https://viacep.com.br/ws/$cep/json/';

    var response = await Dio().get(url);
    print(response.data);
    (querySelector('#state') as InputElement).value = response.data['uf'];
    (querySelector('#city') as InputElement).value = response.data['localidade'];
    (querySelector('#neighborhood') as InputElement).value = response.data['bairro'];
    (querySelector('#street') as InputElement).value = response.data['logradouro'];
  });
}
