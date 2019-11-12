Future<int> heavy() async {
  var hoge = 0;

  await Future.delayed(Duration(seconds: 3));
  return hoge + 1;
}

void main() async {
  print("call heavy");
  final ret = await heavy();

  print("ret is $ret");
}
