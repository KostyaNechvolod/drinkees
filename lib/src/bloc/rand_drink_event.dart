abstract class DrinkEvent {}

class Fetch1 extends DrinkEvent {
  @override
  String toString() => 'Fetch1';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Fetch1 && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

class Fetch2 extends DrinkEvent{

  String _idDrink;

  String get idDrink => _idDrink;

  Fetch2(this._idDrink);

  @override
  String toString() => 'Fetch2';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Fetch1 && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
