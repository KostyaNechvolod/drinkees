import 'package:drinkees/src/models/models.dart';

class DrinkState {
  final bool isInitializing;
  final List<Drink> drinks;
  final bool isError;
  final bool hasReachedMax;

  DrinkState({
    this.isError,
    this.isInitializing,
    this.drinks,
    this.hasReachedMax,
  });

  factory DrinkState.initial() {
    return DrinkState(
      isInitializing: true,
      drinks: [],
      isError: false,
      hasReachedMax: false,
    );
  }

  factory DrinkState.success(List<Drink> drinks) {
    return DrinkState(
      isInitializing: false,
      drinks: drinks,
      isError: false,
      hasReachedMax: false,
    );
  }

  factory DrinkState.failure() {
    return DrinkState(
      isInitializing: false,
      drinks: [],
      isError: true,
      hasReachedMax: false,
    );
  }

  DrinkState copyWith({
    bool isInitializing,
    List<Drink> drinks,
    bool isError,
    bool hasReachedMax,
  }) {
    return DrinkState(
      isInitializing: isInitializing ?? this.isInitializing,
      drinks: drinks ?? this.drinks,
      isError: isError ?? this.isError,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'DrinkState { isInitializing: $isInitializing, drinks: ${drinks.length.toString()}, isError: $isError, hasReachedMax: $hasReachedMax }';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DrinkState &&
              runtimeType == other.runtimeType &&
              isInitializing == other.isInitializing &&
              drinks == other.drinks &&
              isError == other.isError;

  @override
  int get hashCode =>
      isInitializing.hashCode ^ drinks.hashCode ^ isError.hashCode;
}
