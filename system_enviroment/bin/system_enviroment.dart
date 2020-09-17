import 'dart:io';
void main(List<String> arguments) {
print('OS: ${Platform.operatingSystem} ${Platform.version}');

if(Platform.isLinux)
  print('running in linux');




  print('\n Path: ${Platform.script.path}');
  print('\n Dart: ${Platform.executable}');



  print('\n enviroment system');
  Platform.environment.keys.forEach((element) {
    print('$element ${Platform.environment[element]}');
  });
}
