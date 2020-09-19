import 'dart:io';
import 'dart:convert';


void main(List<String> arguments) async {
  var serverSocket = await ServerSocket.bind('127.0.0.1', 3000);
  print('Listening...');

  await for(var socket in serverSocket){
    socket.listen((event) {
     // print('${socket.remoteAddress} : ${socket.remotePort} = ${utf8.decode(event)}');
    print('Client say: ${utf8.decode(event)}');
    });
  }
}
