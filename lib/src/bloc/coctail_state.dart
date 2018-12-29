import 'package:drinkees/src/models/models.dart';

class CoctailState {
  final bool isInitializing;
  final List<Coctail> coctails;
  final bool isError;
  final bool hasReachedMax;

  CoctailState({
    this.isError,
    this.isInitializing,
    this.coctails,
    this.hasReachedMax,
  });

  factory CoctailState.initial() {
    return CoctailState(
      isInitializing: true,
      coctails: [],
      isError: false,
      hasReachedMax: false,
    );
  }

  factory CoctailState.success(List<Coctail> coctails) {
    return CoctailState(
      isInitializing: false,
      coctails: coctails,
      isError: false,
      hasReachedMax: false,
    );
  }

  factory CoctailState.failure() {
    return CoctailState(
      isInitializing: false,
      coctails: [],
      isError: true,
      hasReachedMax: false,
    );
  }

  CoctailState copyWith({
    bool isInitializing,
    List<Coctail> coctails,
    bool isError,
    bool hasReachedMax,
  }) {
    return CoctailState(
      isInitializing: isInitializing ?? this.isInitializing,
      coctails: coctails ?? this.coctails,
      isError: isError ?? this.isError,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'CoctailState { isInitializing: $isInitializing, coctails: ${coctails.length.toString()}, isError: $isError, hasReachedMax: $hasReachedMax }';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoctailState &&
          runtimeType == other.runtimeType &&
          isInitializing == other.isInitializing &&
          coctails == other.coctails &&
          isError == other.isError;

  @override
  int get hashCode =>
      isInitializing.hashCode ^ coctails.hashCode ^ isError.hashCode;
}
