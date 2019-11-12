import 'dart:async';

void main() {
  final controller = StreamController<String>.broadcast();

  controller.stream.listen((str) {
    print("consumer1: $str");
  });

  controller.sink.add("message1");

  controller.stream.listen((str) {
    print("consumer2: $str");
  });

  controller.sink.add("message2");
  controller.sink.add("message3");
}
