import 'package:approval_calculator/approval_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('verify if is approved', () {
    expect(isApproved(6, 9, 7), true);
  });

  test('verify if is not approved', () {
    expect(isApproved(1, 8, 7), false);
  });

  test('verify entries', () {
    //expect(isApproved(11, 8, 7), true);
    expect(isApproved(3, 1, 0), false);
  });

}
