// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:codeclusive_result/codeclusive_result.dart';

///Represents an optional value, either [Some] or [None],
abstract class Option<S> {
  const Option();

  ///Returns true if the option is [Some]
  bool get isSome;

  ///Returns true if the option is [None]
  bool get isNone;

  ///Returns the value if the option is [Some] or null if the option is [None]
  S? get valueOrNull;

  ///Returns the value if the option is [Some] or throws an [Exception] if the option is [None]
  S get valueOrThrow;

  ///Returns the value if the option is [Some] or the [defaultValue] if the option is [None]
  S valueOr(S defaultValue);

  ///Runs the [onSome] function if the option is [Some] or the [onNone] function if the option is [None]
  R fold<R>(R Function(S p1) onSome, R Function() onNone);
}
