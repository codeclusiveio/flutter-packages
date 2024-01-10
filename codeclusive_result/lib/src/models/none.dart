// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:codeclusive_result/src/models/option.dart';

class None<S> implements Option<S> {
  const None();

  @override
  S? get valueOrNull => null;

  @override
  S get valueOrThrow => throw StateError('Option is None');

  @override
  S valueOr(S defaultValue) => defaultValue;

  @override
  bool get isSome => false;

  @override
  bool get isNone => true;

  @override
  R fold<R>(R Function(S p1) onSome, R Function() onNone) => onNone();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is None;
  }

  @override
  String toString() => 'None()';

  @override
  int get hashCode => 0;
}
