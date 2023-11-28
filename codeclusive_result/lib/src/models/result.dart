import 'package:codeclusive_result/codeclusive_result.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class Result<F, S> {
  ///Returns true if the result is [Success]
  bool get isSuccess;

  ///Returns true if the result is [Failure]
  bool get isFailure;

  ///Returns the [Success] value if the result is [Success] or throws an [Exception] if the result is [Failure]
  S get successOrThrow;

  ///Returns the [Failure] value if the result is [Failure] or throws an [Exception] if the result is [Success]
  F get failureOrThrow;

  ///Returns the [Success] value if the result is [Success] or null if the result is [Failure]
  S? get successOrNull;

  ///Returns the [Failure] value if the result is [Failure] or null if the result is [Success]
  F? get failureOrNull;

  ///Returns the [Success] value if the result is [Success] or the [defaultValue] if the result is [Failure]
  S successOr(S defaultValue);

  ///Returns the [Failure] value if the result is [Failure] or the [defaultValue] if the result is [Success]
  F failureOr(F defaultValue);

  ///Folds the result to a single value, depending on the result type
  R fold<R>(
    R Function(S) onSuccess,
    R Function(F) onFailure,
  );

  ///Wraps the value in a [Some] instance
  Some<Result<F, S>> asSome();
}
