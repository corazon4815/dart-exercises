import 'dart:math';

void validateWinning(List<int> win) {
  if (win.length != 6) throw FormatException('당첨 번호는 6개여야 합니다.');
  if (win.toSet().length != 6) throw ArgumentError('당첨 번호에 중복이 있습니다.');
  if (!win.every((n) => n >= 1 && n <= 45)) {
    throw RangeError('번호는 1~45 범위여야 합니다.');
  }
}

List<int> drawLotto() {
  final rnd = Random();
  final set = <int>{};
  while (set.length < 6) {
    set.add(rnd.nextInt(45) + 1);
  }
  final list = set.toList()..sort();
  return list;
}

String? judge(int same) {
  if (same >= 5) return '1등';
  if (same == 4) return '2등';
  if (same == 3) return '3등';
  return null;
}

// 보너스 조건 (나만의 기능)
bool hasTwoConsecutivePairs(List<int> ticket) {
  final t = [...ticket]..sort();
  int pairs = 0;
  for (int i = 0; i + 1 < t.length; i++) {
    if (t[i] + 1 == t[i + 1]) {
      pairs++;
      i++; // 방금 사용한 다음 원소는 건너뛰어 중복 카운트 방지
    }
  }
  return pairs >= 2;
}

void main() {
  try {
    print('도전 문제');
    final lotto = drawLotto();
    //보너스 조건 번호 예시
    //final lotto = [4, 3, 2, 1, 37, 38];
    print('\n발급한 로또 번호 : $lotto');

    final winning = [9, 19, 29, 35, 37, 38];
    validateWinning(winning); // 형식/중복/범위 체크

    final match = lotto.where(winning.contains).length;
    final rank = judge(match);

    if (rank != null) {
      print('\n당첨 여부 : $rank');
    } else {
      // 일치가 2개인 경우에만 보너스 조건 검사
      if (match == 2 && hasTwoConsecutivePairs(lotto)) {
        print('\n당첨 여부 : 당첨 실패… 하지만 연속 쌍 2개 발견! 🎉');
        print('→ 보너스 기회 한번 더!');
      } else {
        print('\n당첨 여부 : 당첨 실패');
      }
    }

    final cleared = <int>[];
    print('\n현재 발급한 로또 번호 : $cleared');
  } on FormatException catch (e) {
    print('형식 오류: ${e.message}');
  } on ArgumentError catch (e) {
    print('인자 오류: ${e.message}');
  } on RangeError catch (e) {
    print('범위 오류: ${e.message}');
  }
}
