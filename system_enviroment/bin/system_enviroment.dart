import 'dart:convert';
import 'dart:io';
void main(List<String> arguments) {
/*print('OS: ${Platform.operatingSystem} ${Platform.version}');

if(Platform.isLinux)
  print('running in linux');




  print('\n Path: ${Platform.script.path}');
  print('\n Dart: ${Platform.executable}');



  print('\n enviroment system');
  Platform.environment.keys.forEach((element) {
    print('$element ${Platform.environment[element]}');
  });*/

//Process.run('ls', ['-l']).then((value) => print(value.stdout + '\nexit code: ${value.exitCode}'));

Process.start('cat', []).then((value){
  value.stdout.transform(utf8.decoder).listen((event) {
    print(event);
  });
  value.stdin.writeln('Fala zeze');
  value.kill();
});

}
