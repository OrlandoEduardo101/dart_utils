import 'package:approval_calculator/approval_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('verify if is approved', () {
    expect(isApproved(6, 9, 7), true);
  });

  test('verify if is not approved', () {
    expect(isApproved(1, 8, 7), false);
  });
}
