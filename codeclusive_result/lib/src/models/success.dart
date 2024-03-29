// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:codeclusive_result/src/models/result.dart';
import 'package:codeclusive_result/src/models/some.dart';

class Success<F, S> implements Result<F, S> {
  const Success(this.value);

  final S value;

  @override
  F failureOr(F defaultValue) => defaultValue;

  @override
  F? get failureOrNull => null;

  @override
  F get failureOrThrow => throw Exception('result is not a failure');

  @override
  R fold<R>(R Function(S p1) onSuccess, R Function(F p1) onFailure) {
    return onSuccess.call(value);
  }

  @override
  bool get isFailure => false;

  @override
  bool get isSuccess => true;

  @override
  S successOr(S defaultValue) => value;

  @override
  S? get successOrNull => value;

  @override
  S get successOrThrow => value;

  @override
  Some<Result<F, S>> asSome() {
    return Some(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Success && other.value == value;
  }

  @override
  String toString() => 'Success(value: $value)';

  @override
  int get hashCode => value.hashCode;
}
