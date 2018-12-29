abstract class CoctailEvent {}

class Fetch extends CoctailEvent {
  @override
  String toString() => 'Fetch';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Fetch && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
