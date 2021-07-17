import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

typedef SumFunc = Int32 Function(Int32 a, Int32 b);
typedef Sum = int Function(int a, int b);

typedef SubtractFunc = Int32 Function(Pointer<Int32> a, Int32 b);
typedef Subtract = int Function(Pointer<Int32> a, int b);

typedef MultiplyFunc = Pointer<Int32> Function(Int32 a, Int32 b);
typedef Multiply = Pointer<Int32> Function(int a, int b);

typedef MultiSumFunc = Int32 Function(Int32 numCount, Int32 a, Int32 b, Int32 c);
typedef MultiSum = int Function(int numCount, int a, int b, int c);

typedef FreePointerFunc = Void Function(Pointer<Int32> a);
typedef FreePointer = void Function(Pointer<Int32> a);

void main(List<String> arguments) {
  var libraryPath = path.join(Directory.current.path, 'primitives_library', 'libprimitives.so');

  if (Platform.isMacOS) {
    libraryPath = path.join(
        Directory.current.path, 'primitives_library', 'libprimitives.dylib');
  }
  if (Platform.isWindows) {
    libraryPath = path.join(
        Directory.current.path, 'primitives_library', 'Debug', 'primtives.dll');
  }

  final dylib = DynamicLibrary.open(libraryPath);

  final sumPointer = dylib.lookup<NativeFunction<SumFunc>>('sum');
  final sum = sumPointer.asFunction<Sum>();
  print('3 + 5 = ${sum(3, 5)}');

  final p = calloc<Int32>();
  // Place a value into the address
  p.value = 3;

  final subtractPointer =
  dylib.lookup<NativeFunction<SubtractFunc>>('subtract');
  final subtract = subtractPointer.asFunction<Subtract>();
  print('3 - 5 = ${subtract(p, 5)}');

  calloc.free(p);

  final multiplyPointer =
  dylib.lookup<NativeFunction<MultiplyFunc>>('multiply');
  final multiply = multiplyPointer.asFunction<Multiply>();
  final resultPointer = multiply(3, 5);
  // Fetch the result at the address pointed to
  final int result = resultPointer.value;
  print('3 * 5 = $result');

  final freePointerPointer =
  dylib.lookup<NativeFunction<FreePointerFunc>>('free_pointer');
  final freePointer = freePointerPointer.asFunction<FreePointer>();
  freePointer(resultPointer);

  final multiSumPointer =
  dylib.lookup<NativeFunction<MultiSumFunc>>('multi_sum');
  final multiSum = multiSumPointer.asFunction<MultiSum>();
  print('3 + 7 + 11 = ${multiSum(3, 3, 7, 11)}');

}
