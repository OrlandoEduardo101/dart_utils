import 'dart:html';

void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  querySelector('#output').onClick.listen((event) {
    querySelector('#output').text = 'fala zeze.';
    print('click');
  });
}
