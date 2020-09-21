import 'dart:html';

import 'package:dialog/dialogs/alert.dart';
import 'package:dialog/dialogs/prompt.dart';
import 'package:dio/dio.dart';

void main() {
  List cities = List();
  cities.add('Cruz das Almas');
  cities.add('Cabaceiras do Paraguaçu');
  cities.add('Crato');
  cities.add('Aracajú');
  cities.add('Cachoeira');

  loadData(cities);

  querySelector('#search').onClick.listen((event) async {
    var myPrompt = await prompt(("Qual cidade você quer buscar?"));
    if(myPrompt.toString().isNotEmpty)
      loadData([myPrompt.toString()]);
    else
      alert('Nenhuma cidade informada');
  });
}

Future getWeather(String city) {
  String url =
      'https://api.hgbrasil.com/weather?format=json-cors&key=bbaf867e&city_name=$city';
  return Dio().get(url);
}

void loadData(List cities) {
  var empty = querySelector('#empty');
  if (empty != null) empty.remove();

  cities.forEach((element) {
    insertData(getWeather(element));
  });
}

void insertData(Future data) async {
  var insertData = await data;
  var body = insertData.data;

  if (body['results']['forecast'].length > 0) {
    String html = '<div class="row">';
    html += formatedHTML(body['results']['city_name']);
    html += formatedHTML(body['results']['temp']);
    html += formatedHTML(body['results']['description']);
    html += formatedHTML(body['results']['wind_speedy']);
    html += formatedHTML(body['results']['sunrise']);
    html += formatedHTML(body['results']['sunset']);
    html += '</div>';

    querySelector('.table').innerHtml += html;
  }
}

String formatedHTML(var data) {
  return '<div class="cell">$data</div>';
}

//bbaf867e
