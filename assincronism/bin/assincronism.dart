import 'dart:async';

import 'dart:io';


int counter = 0;

void main(List<String> arguments) async {

  print('Start');
  appendFile();

  print(await readFile());
  print('######### End #########');



  /*String path = Directory.current.path + '/test.txt';
  File file = File(path);

  Future<RandomAccessFile> f = file.open(mode: FileMode.append);

  f.then((value){
    print('File opened');

    value.writeString('Fala zeze').then((value) => print('Sucessful open file')).catchError(
        (error) => print('Error: $error')
    ).whenComplete(() => value.close());
  });

  print('############# Final ############');
*/


 /* Duration duration = Duration(seconds: 2);
  Timer.periodic(duration, timeout);

  print('init: ${getTime()}');*/
}

void appendFile(){
  File file = File(Directory.current.path+'/test.txt');
  DateTime dt = DateTime.now();
  file.writeAsString(dt.toString() + '\r\n', mode: FileMode.append);
}

Future<String> readFile(){
  File file = File(Directory.current.path+'/test.txt');
  return file.readAsString();
}

/*void timeout(Timer timer){
  print('wait: ${getTime()}');

  counter++;
  if(counter >= 5)
    timer.cancel();
}

getTime(){
  DateTime dt = DateTime.now();
  return dt.toString();
}*/
