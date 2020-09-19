
import 'dart:convert';
import 'dart:io';

void main(List<String> arguments)  {
  var data = "******* Send Informations UDP Protocol *********";
  int port = 3000;
  List<int> dataToSend = utf8.encode(data);

  RawDatagramSocket.bind(InternetAddress.loopbackIPv4, 3000).then((value) {

    value.send(dataToSend, InternetAddress.loopbackIPv4, port);

  });


  /*bool loop = true;

  var socket = await Socket.connect('127.0.0.1', 3000);
  
  while(loop){
    print('Connected! What do you want says?');
    String text = stdin.readLineSync();
    socket.write(text);
  }
  await socket.close();*/
  exit(0);
}
