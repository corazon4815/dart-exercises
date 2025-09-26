void main() {

  final prices = {
    '티셔츠': 10000,
    '바지'  : 8000,
    '모자'  : 4000,
  };


  final cart = ['티셔츠', '바지', '모자', '티셔츠', '바지'];


  final total = cart.fold<int>(0, (sum, item) => sum + (prices[item] ?? 0));


  final discount = total >= 20000 ? (total * 10) ~/ 100 : 0;
  final finalPay = total - discount;

  print('필수 문제 2번\n');
  print('장바구니에 ${total}원 어치를 담으셨네요 !\n');

  if (discount > 0) {
    print('할인금액 : ${discount}원\n');
  }

  print('최종적으로 결제하실 금액은 ${finalPay}원입니다 !');
}
