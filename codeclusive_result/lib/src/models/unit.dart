import 'package:codeclusive_result/codeclusive_result.dart';
import 'package:flutter/foundation.dart';

@immutable

///A class that represents a unit value (void)
class Unit {
  const Unit();

  static Success<T, Unit> asSuccess<T>() => const Success(Unit());

  static Failure<Unit, T> asFailure<T>() => const Failure(Unit());

  static Some<Unit> asSome() => const Some(Unit());
}
