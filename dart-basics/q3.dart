// lotto_challenge.dart
import 'dart:math';

void main() {
  print('도전 문제\n');

  // 1) 로또 번호 발급 (1~45 중 중복 없이 6개)
  final lotto = _issueLotto();
  print('발급한 로또 번호 : $lotto\n');

  // 2) 당첨 판정
  const winning = [9, 19, 29, 35, 37, 38];
  final hitCount = lotto.where(winning.contains).length;

  String result;
  if (hitCount >= 5) {
    result = '당첨 1등';
  } else if (hitCount == 4) {
    result = '당첨 2등';
  } else if (hitCount == 3) {
    result = '당첨 3등';
  } else {
    result = '당첨 실패';
  }
  print('당첨  여부 : $result\n');

  // 3) 초기화
  lotto.clear();
  print('현재 발급한 로또 번호: $lotto');
}

List<int> _issueLotto() {
  final r = Random();
  final set = <int>{};
  while (set.length < 6) {
    set.add(r.nextInt(45) + 1); // 1~45
  }
  final list = set.toList()..sort();
  return list;
}
