import 'package:binary_search/binary_search.dart';
import 'package:test/test.dart';

//import '../lib/binary_search.dart';


void main() {

  test('add list', () {
    expect(getList(), ['1','2','3']);
      });
  test('binary search', () {
    expect(binarySearch([1,2,3], 3, 3), 2);
      });
  test('binary search not found', () {
    expect(binarySearch([1,2,3], 4, 3), (-1));
      });
  }
    
