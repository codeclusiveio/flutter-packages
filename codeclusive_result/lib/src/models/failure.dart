import 'package:codeclusive_result/src/models/result.dart';
import 'package:codeclusive_result/src/models/some.dart';

class Failure<F, S> implements Result<F, S> {
  const Failure(
    this.value,
  );

  final F value;

  @override
  F failureOr(F defaultValue) => value;

  @override
  F? get failureOrNull => value;

  @override
  F get failureOrThrow => value;

  @override
  R fold<R>(R Function(S p1) onSuccess, R Function(F p1) onFailure) {
    return onFailure.call(value);
  }

  @override
  bool get isFailure => true;

  @override
  bool get isSuccess => false;

  @override
  S successOr(S defaultValue) => defaultValue;

  @override
  S? get successOrNull => null;

  @override
  S get successOrThrow => throw Exception('result is not a success');

  @override
  Some<Result<F, S>> asSome() {
    return Some(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && other.value == value;
  }

  @override
  String toString() => 'Failure(value: $value)';

  @override
  int get hashCode => value.hashCode;
}
