import 'package:codeclusive_result/codeclusive_result.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class Result<F, S> {
  bool get isSuccess;
  bool get isFailure;

  S get successOrThrow;
  F get failureOrThrow;

  S? get successOrNull;
  F? get failureOrNull;

  S successOr(S defaultValue);
  F failureOr(F defaultValue);

  R fold<R>(
    R Function(S) onSuccess,
    R Function(F) onFailure,
  );

  Some<Result<F, S>> asSome();
}
