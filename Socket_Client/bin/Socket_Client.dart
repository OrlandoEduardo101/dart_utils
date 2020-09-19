
import 'dart:io';

void main(List<String> arguments) async {
  bool loop = true;

  var socket = await Socket.connect('127.0.0.1', 3000);
  
  while(loop){
    print('Connected! What do you want says?');
    String text = stdin.readLineSync();
    socket.write(text);
  }
  await socket.close();
  exit(0);
}
