Stream<String> hoge() async* {
  yield "hoge1";
  await Future.delayed(Duration(seconds: 3));
  yield "hoge2";
  yield "hoge3";
}

void main() {
  var i = 0;
  hoge().listen((str) {
    print("$i ... $str");
    i++;
  });
}
