
class Counter {

  int value;

  Counter({this.value = 0});

  increment() => value++;
  decrement() => value--;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Counter &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Counter{value: $value}';
  }
}