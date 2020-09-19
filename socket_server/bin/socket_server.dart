import 'dart:io';
import 'dart:convert';


void main(List<String> arguments) {
  var data = "******* Send Informations UDP Protocol *********";
  List<int> dataToSend = utf8.encode(data);
  int port = 3000;

  //server
  RawDatagramSocket.bind(InternetAddress.loopbackIPv4, port).then((value){
    value.listen((event) {
      if(event == RawSocketEvent.read){
        print('Server Listening...');
        Datagram dg = value.receive();
        print(utf8.decode(dg.data));
      }
    });
    value.send(dataToSend, InternetAddress.loopbackIPv4, port);
  });


  /*var serverSocket = await ServerSocket.bind('127.0.0.1', 3000);
  print('Listening...');

  await for(var socket in serverSocket){
    socket.listen((event) {
     // print('${socket.remoteAddress} : ${socket.remotePort} = ${utf8.decode(event)}');
    print('Client say: ${utf8.decode(event)}');
    });
  }*/
}
