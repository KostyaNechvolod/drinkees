abstract class DrinkEvent {}

class Fetch1 extends DrinkEvent {
  @override
  String toString() => 'Fetch';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Fetch1 && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
