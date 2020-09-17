import 'dart:async';

int counter = 0;

void main(List<String> arguments) {
  Duration duration = Duration(seconds: 2);
  Timer.periodic(duration, timeout);

  print('init: ${getTime()}');
}

void timeout(Timer timer){
  print('wait: ${getTime()}');

  counter++;
  if(counter >= 5)
    timer.cancel();
}

getTime(){
  DateTime dt = DateTime.now();
  return dt.toString();
}
