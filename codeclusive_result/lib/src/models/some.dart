// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:codeclusive_result/codeclusive_result.dart';
import 'package:codeclusive_result/src/models/option.dart';

class Some<S> implements Option<S> {
  const Some(this.value);

  final S value;

  @override
  S? get valueOrNull => value;

  @override
  S get valueOrThrow => value;

  @override
  S valueOr(S defaultValue) => value;

  @override
  bool get isSome => true;

  @override
  bool get isNone => false;

  @override
  R fold<R>(R Function(S p1) onSome, R Function() onNone) => onSome(value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Some && other.value == value;
  }

  @override
  String toString() => 'Some(value: $value)';

  @override
  int get hashCode => value.hashCode;
}
